pragma solidity ^0.4.11;

contract CargoContract{
    address public owner;
    address public recipient;
    
    uint public weight; //in kilogramms
    uint public volume; //in liters
    uint public amount; //in rubbles
    
    bytes public info;
    bytes public from;
    bytes public to;
    mapping(uint256 => bool) public rfids;
    bool  public completed;
    
    
    function CargoContract(address _recipient, bytes _info, bytes _from, bytes _to, uint256[] _rfids, uint _weight, uint _volume, uint _amount){
        owner = msg.sender;
        recipient = _recipient;
        
        info = _info;
        from = _from;
        to   = _to;
        for(uint i = 0; i < _rfids.length; i++){
            rfids[_rfids[i]] = true;
        }
        
        weight = _weight;
        volume = _volume;
        amount = _amount;
        
        completed = false;
    }
    
    function ChangeInfo(bytes _info){
        require(msg.sender == owner || msg.sender == recipient);
        
        info = _info;
    }
    
    function AddRFID(uint256[] _rfids){
        for(uint i = 0; i < _rfids.length; i++){
            rfids[_rfids[i]] = true;
        }
    }
    
    function Complete(){
        require(msg.sender == recipient);
        completed = true;
    }
    
}

contract CargoManagerContract{
    
    struct Depot{
        uint weight;
        uint volume;
        uint amount;
    }
    
    address manager;
    mapping(address => bool) members;
    mapping(address => CargoContract) public CargoList;
    mapping(address => Depot) public MemberDepot;
    
    function CargoManagerContract(){
        manager = msg.sender;
    }
    
    function Register(){
        members[msg.sender] = true;
    }
    
    function Unregister(address member){
        require(msg.sender == manager);
        
        members[member] = false;
    }
    
    function RegisterCargo(address _recipient, bytes _info, bytes _from, bytes _to, uint256[] _rfids, uint _weight, uint _volume, uint _amount){
        require(members[msg.sender]);
        require(members[_recipient]);
        
        CargoContract cargo = new CargoContract(_recipient, _info, _from, _to, _rfids, _weight, _volume, _amount);
        CargoList[msg.sender] = cargo;
        MemberDepot[msg.sender] = Depot({
            weight: cargo.weight(),
            volume: cargo.volume(),
            amount: cargo.amount()
        });
    }
    
    function AcceptCargo(CargoContract cargo){
        require(msg.sender == cargo.recipient());
        cargo.Complete();
        Depot depot = MemberDepot[msg.sender];
        depot.weight += cargo.weight();
        depot.volume += cargo.volume();
        depot.amount += cargo.amount();
        MemberDepot[msg.sender] = depot;
        
        Depot owner_depot = MemberDepot[cargo.owner()];
        owner_depot.weight -= cargo.weight();
        owner_depot.volume -= cargo.volume();
        owner_depot.amount -= cargo.amount();
        MemberDepot[cargo.owner()] = owner_depot;
    }
    
    function DepotCargo(address _recipient, bytes _info, bytes _from, bytes _to, uint256[] _rfids, uint _weight, uint _volume, uint _amount){
        require(members[msg.sender]);
        require(members[_recipient]);
        
        Depot depot = MemberDepot[msg.sender];
        require(depot.weight >= _weight && depot.volume >= _volume && depot.amount >= _amount);
        
        CargoContract cargo = new CargoContract(_recipient, _info, _from, _to, _rfids, _weight, _volume, _amount);
        CargoList[msg.sender] = cargo;
        
        depot.weight -= cargo.weight();
        depot.volume -= cargo.volume();
        depot.amount -= cargo.amount();
        
        MemberDepot[msg.sender] = depot;
        
    }
    
}