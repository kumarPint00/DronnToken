//SPDX-License-Identifier:MIT


pragma solidity ^0.8.0;

contract ERC20{
	function totalSupply() public view returns(uint total_Supply);
	function balanceOf(address who) public view returns (uint256);
	function allowance(address owner, address spender) public view returns(uint);
	function transferFrom(address from, address to, uint value) public returns (bool ok);
	function approve (address spender, uint value) public returns(bool ok);
	function transfer(address to, uint value)public returns (bool ok);
	event Transfer(address indexed from, address indexed to, uint value);
	event Approval (address indexed owner, address indexed spender, uint value);
}

contract DronnToken is ERC20{

	string public constant name = "DRONN";
	string public constant symbol = "DRN";
	uint public constant decimals = 18;
	uint public _totalsupply = 360_000_0000*10**18;
	
	address public owner;
	uint256 public _price_token_PRE= 16000;
	uint256 public _price_token_ICO1=8000;
	uint256 public _price_token_ICO2=4000;
	uint256 public _price_token_ICO3=2666;
	uint256 public _price_token_ICO4=2000;

	uint256 no_of_tokens;	
	uint256 bonus_token;
	uint256 total_token;
	bool stopped = false;
	uint256 public pre_startdate;
	uint256 public ico1_startdate;
	uint256 ico_first;
	uint256 ico_second;
	uint256 ico_third;
	uint256 ico_fourth;
	uint256 pre_enddate;
	uint256 public eth_received;
	uint256 maxCap_public = 240_000_000*10**18;
	mapping (address=> uint) balances;
	mapping(address=> mapping(address=> uint)) allowed;
	ParserError: Expected '(' but got identifier
	enum Stages{
	NOTSTARTED,
	PREICO,
	ICO,
	PAUSED,
	ENDED
}

	Stages public stage;
	modifier atStage(Stages_stage){
		if(stage != stage)
			revert();
		_;
	}

	modifier onlyOnwner(){
	if (msg.sender != owner){
		revert();
	_;
	}

	function FlexiCoin() public {
	owner= msg.sender;
	balances[owner] =120_000_000*10**18;

	stage = Stages.NOTSTARTED;
	Transfer(0,owner,balances[owner]);

function () public payable{
	require (stage!= Stages.ENDED);
	require(!stopped && msg.sender != owner);
		if (stage == Stages.PREICO && now <= pre_enddate){
			require (eth_received <= 1500 ether);
			eth_received = eth_received+ msg.value;
			no_of_tokens = msg.value* _price_token_PRE;
			require (no_of_tokens>= (500*10**18));
			bonus_token = ((no_of_tokens)*50/100;
			total_token = no_of_tokens+ bonus_token;
			transferTokens(msg.sende, total_token);
		}

		else if (stage==Stage.ICO && now <= ico_fouth){
			if (now < ico_first )
			{
			no_of_tokens= (msg.value)*_price_token_ICO1;
			require(no_of_tokens>= (100*10**18));
			bonus_token = no_of_tokens*40/100;
			total_token = no_of_tokens+bonus_token;
			transferTokens(msg.sender, total_token);
			}
			else if (now >=ico_first && now < ico_second)
			{
			no_of_tokens= msg.value*_price_token_ICO2;
			require(no_of_tokens>=(100*10**18));
			bonus_token= no_of_tokens*30/100;
			total_token = no_of_tokens+bonus_token;
			transferTokens(msg.sender, total_token);
			}
			else if (now>=ico_second && now<ico_third)
			{
			no_of_tokens= msg.value*_price_token_ICO2;
			require (no_of_tokens>= (100*10**18);
			bonus_token =no_of_tokens*30/100;
			total_token= no_of_tokens+bonus_token;
			transferTokens(msg.sender,total_token);
			}
			else if (now>=ico_third && now<ico_fourth)
			{
			no_of_tokens=msg.value*_price_of_token_ICO4;
			require(no_of_tokens>=(100*10**18);
			bonus_token = no_of_tokens*10/100;
			total_token = no_of_tokens+bonus_token;
			transferTokens(msg.sender,total_token);
			}
		}
		else
		{
			revert();
		}
	}
	function start_PREICO() public onlyOwner atStage(Stages.PREICO)
	{
		stage = Stages.PREICO;
		stopped = false;
		balances[address(this)] = maxCap_public;
		pre_startdate = now;
		pre_enddate = now +30 days;
		Transfer(0,address(this), balances[address(this)]);
	}
	function start_ICO() public onlyOwner atStage(Stage.PREICO)
	{
		require(now>pre_enddate);
		stage = Stages.ICO;
		stopped = false;
		ico1_startdate = now;
		ico_first = now + 15 days;
		ico_second = ico_first + 15 days;
		ico_third = ico_second +15 days;
		ico_fourth = ico_third +15 days;
		Transfer(0,address(this), balances[address(this)]);
function PauseICO() external onlyOwner{
	stopped = true;
}
function ResumeICO() external onlyOwner {
	stopped = false;
}

function end_ICO() external onlyOwner atStage(Stages.ICO)
{
	require(now>ico_fourth);
	stage = Stages.ENDED;
	_totalsupply = _totalsupply-balances[address(this)];
	balances[address(this)]=0;
	Transfer(address(this),0,balances[address(this)]);
}
function totalSupply() public view returns (uint256, total_Supply) {
	total_Supply = _totalsupply;
}
function balanceOf(address _owner) public view returns(uint256 balance){
	return balances[_owner];
}

function transferFrom( address _from , address _to, uint256 _amount)public returns(bool success){
	require(_to !=0x0);
	require(balances[_from] >= amount && allowed[_from][msg.sender] >= _amount && _amount>=0);
	allowed[_from][msg.sender]= allowed[_from][msg.sender]-_amount;
	balances[_to] = balances[_to] + _amount;
	Transfer(_from, _to, _amount);
	return true;
}

function approve (address _spender, uint256 _amount) public returns (bool success){
	require(_spender !=0x0);
	allowed[msg.sender][_spender]=_amount;
	Approval(msg.sender,_spender,amount);
	return true;
}
function allowance(address _owner, address _spender)public view returns(uint256 remaing){
	require(_owner!=0x0 && _spender !=0x0);
	return allowed[_owner][_spender];
	}
function transfer(address _to, uint256 _amount) public returns(bool success) {
	require(_to != 0x0);
	require(balance[msg.sender] >= amount && _amount>=0);
	balances[msg.sender]=(balances[msg.sender])-_amount;
	balances[_to] = balances[_to]+_amount;
	Transfer(msg.sender, _to,_amount);
	return true;
	}
function transferTokens(address _to, uint256 _amount) private returns (bool success){
	require(_to !=0x0);
	require(balances[address(this)]>= _amount && _amount>=0);
	balances[address(this) = balances[address(this) - _amount;
	balances[_to] = balances[_to]+ _amount;
	Transfer(address(this),_to,_amount);
}
function drain () external onlyOwner{
	owner.transfer(this.balance);
}
}	
				
