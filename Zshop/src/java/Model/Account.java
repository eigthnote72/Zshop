/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Eighth_Note
 */
public class Account {
    private int accountID;
    private String username;
    private String password;
    private String position;
    private String email;
    private String phone;
    private String name;
    private String address;

    public Account() {
    }

    public Account(int accountID, String username, String password, String position, String email, String phone, String name, String address) {
        this.accountID = accountID;
        this.username = username;
        this.password = password;
        this.position = position;
        this.email = email;
        this.phone = phone;
        this.name = name;
        this.address = address;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

   

    
    
}
