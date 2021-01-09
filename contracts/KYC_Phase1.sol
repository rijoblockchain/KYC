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
    
    
    function addCustomer(bytes32  _userName, bytes32  _customerData) public returns(bool) {
        require(customerList[_userName].userName == 0, "Customer already present");
        customerList[_userName].userName = _userName; 
        customerList[_userName].customerData = _customerData; 
        return true;
    } 
    
    function removeCustomer(bytes32  _userName) public returns(bool) {
        require(customerList[_userName].userName != 0, "Customer not present");
        delete customerList[_userName];
        return true;
        
    }
    
    function modifyCustomer(bytes32  _userName, bytes32  _newCustomerData) public returns(bool) {
        require(customerList[_userName].userName != 0, "Customer not present");
        customerList[_userName].customerData = _newCustomerData; 
        return true;
    }
    
    function viewCustomer(bytes32 _userName) public view returns(bytes32) {
        require(customerList[_userName].userName != 0, "Customer not present");
        return customerList[_userName].customerData;
    }
    
    
    
}
