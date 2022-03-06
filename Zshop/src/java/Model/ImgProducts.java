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
public class ImgProducts {
    private String category_groupID;
    private  String img;

    public ImgProducts() {
    }

    public ImgProducts(String category_groupID, String img) {
        this.category_groupID = category_groupID;
        this.img = img;
    }

    public String getCategory_groupID() {
        return category_groupID;
    }

    public void setCategory_groupID(String category_groupID) {
        this.category_groupID = category_groupID;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
     
}
