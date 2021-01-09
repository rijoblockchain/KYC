// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract KYCPhase1 {
    
    struct Customer {
        bytes32 userName;
        bytes32 customerData;
        address bank;
    }
    
    struct Bank {
        bytes32 name;
        address ethAddress;
        bytes32 regNumber;
    }
    
    mapping(bytes32 => Customer) customerList;
    
    
    function addCustomer(bytes32  _userName, bytes32  _customerData) external customerNotPresent(_userName) returns(bool) {
        customerList[_userName].userName = _userName; 
        customerList[_userName].customerData = _customerData; 
        return true;
    } 
    
    function removeCustomer(bytes32  _userName) external customerPresent (_userName) returns(bool) {
        delete customerList[_userName];
        return true;
        
    }
    
    function modifyCustomer(bytes32  _userName, bytes32  _newCustomerData) external customerPresent (_userName) returns(bool) {
        customerList[_userName].customerData = _newCustomerData; 
        return true;
    }
    
    function viewCustomer(bytes32 _userName) external customerPresent (_userName) view returns(bytes32) {
        return customerList[_userName].customerData;
    }
    
    
    modifier customerNotPresent (bytes32 _userName) {
        require(customerList[_userName].userName == 0, "Customer already present");
        _;
        
    }
    
    modifier customerPresent (bytes32 _userName) {
        require(customerList[_userName].userName != 0, "Customer not present");
        _;
        
    }
}
