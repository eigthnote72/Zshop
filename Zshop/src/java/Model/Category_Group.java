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
public class Category_Group {
    private String CGID;
    private String CGName;
    private String CID;

    public Category_Group() {
    }

    public Category_Group(String CGID, String CGName, String CID) {
        this.CGID = CGID;
        this.CGName = CGName;
        this.CID = CID;
    }

    public String getCGID() {
        return CGID;
    }

    public void setCGID(String CGID) {
        this.CGID = CGID;
    }

    public String getCGName() {
        return CGName;
    }

    public void setCGName(String CGName) {
        this.CGName = CGName;
    }

    public String getCID() {
        return CID;
    }

    public void setCID(String CID) {
        this.CID = CID;
    }
    
}
