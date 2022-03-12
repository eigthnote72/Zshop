/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Model.Category;
import Model.Category_Group;
import Model.ImgProducts;
import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Eighth_Note
 */
public class GetDataDAO extends BaseDAO {

    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> listProduct = new ArrayList<>();

        try {
            String sql = "select ProductID,ProductName,ProductPrice,Storage,Image,CGID from Products";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getString("ProductID"));
                p.setProductName(rs.getString("ProductName"));

                String getPrice = rs.getString("ProductPrice");
                int count = 0;
                String price = "";
                String temp = "";
                String a[] = getPrice.split("");
                for (int i = getPrice.length() - 1; i >= 0; i--) {
                    count++;
                    temp = temp + a[i];
                    if (count == 3) {
                        count = 0;
                        price = price + temp + ".";
                        temp = "";
                    }
                }
                if (!temp.isEmpty()) {
                    price = price + temp;
                }
                String result = "";
                for (int i = price.length() - 1; i >= 0; i--) {
                    result = result + price.charAt(i);
                }

                p.setProductPrice(result);
                p.setStorage(rs.getString("Storage"));
                p.setImage(rs.getString("Image"));
                p.setCategory_groupID(rs.getString("CGID"));
                listProduct.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GetDataDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProduct;
    }
    
    public ArrayList<Product> getAllProductToUpdate() {
        ArrayList<Product> listProduct = new ArrayList<>();

        try {
            String sql = "select ProductID,ProductName,ProductPrice,Storage,Image,CGID from Products";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getString("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setProductPrice(rs.getString("ProductPrice"));
                p.setStorage(rs.getString("Storage"));
                p.setImage(rs.getString("Image"));
                p.setCategory_groupID(rs.getString("CGID"));
                listProduct.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GetDataDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProduct;
    }
    
    public ArrayList<Category> getBrand (){
        ArrayList<Category> listBrand = new ArrayList<>();
        try {
            String sql = "SELECT [CID],[CName] FROM [Zshop].[dbo].[Category]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setcID(rs.getString("CID"));
                c.setcName(rs.getString("CName"));
                listBrand.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GetDataDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listBrand;
        
    }
    
    public ArrayList<Product> getProductByID (String id){
        ArrayList<Product> listPByID = new ArrayList<>();
        try {
            String sql = "Select ProductID,ProductName,ProductPrice,Storage,Image,CGID from Products where ProductID like ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%"+id+"%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getString("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setProductPrice(rs.getString("ProductPrice"));
                p.setStorage(rs.getString("Storage"));
                p.setImage(rs.getString("Image"));
                p.setCategory_groupID(rs.getString("CGID"));
                listPByID.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GetDataDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listPByID;
        
    }
    
    public ArrayList<Category_Group> getAllCategory_Group (){
        ArrayList<Category_Group> listCG = new ArrayList<>();
        try {
            String sql = "SELECT  [CGID],[CGName],[CID] FROM [Zshop].[dbo].[Category_Group]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category_Group cg = new Category_Group();
                cg.setCGID(rs.getString("CGID"));
                cg.setCGName(rs.getString("CGName"));
                cg.setCID(rs.getString("CID"));
                listCG.add(cg);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GetDataDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCG;
        
    }
    
    public void insertProduct(Product a){
         try {
            String sql = "INSERT INTO Products (ProductID,ProductName, ProductPrice, Storage,Image , CGID) VALUES (?,?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, a.getProductID());
            statement.setString(2, a.getProductName());
            statement.setString(3, a.getProductPrice());
            statement.setString(4, a.getStorage());
            statement.setString(5, a.getImage());
            statement.setString(6, a.getCategory_groupID());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(GetDataDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         
         
    }
    
    public  void insertCategory_Group(Category_Group cg){
        try {
            String sql = " INSERT INTO [Category_Group] ([CGID], [CGName], [CID]) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, cg.getCGID());
            statement.setString(2, cg.getCGName());
            statement.setString(3, cg.getCID());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(GetDataDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateProduct(String name, String price, String image, String productID){
        try {
            String sql = " UPDATE [Products]\n" +
                           "SET [ProductName] = ? , [ProductPrice] = ?,[Image] = ? where [ProductID] = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, price);
            statement.setString(3, image);
            statement.setString(4, productID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(GetDataDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateCategory_Group(String CGID , String CID){
        try {
            
            String sql = "  UPDATE [Category_Group]\n" +
                                   "SET [CID] = ?\n" +
                                   "WHERE [CGID] = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, CID);
            statement.setString(2, CGID);
            statement.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(GetDataDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteProduct(String idProduct){
           
            try {
            String sql = "DELETE Products where ProductID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, idProduct);
            statement.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(GetDataDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Product> getProductbyCategory(String CID){
        ArrayList<Product> listP = new ArrayList<>();
        try {
            
            String sql = "select [ProductID],[ProductName],[ProductPrice],[Storage],[Image],p.[CGID] from Products p inner join Category_Group c\n" +
                         "on p.CGID  = c.CGID \n" +
                         "where  c.CID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, CID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getString("ProductID"));
                p.setProductName(rs.getString("ProductName"));

                String getPrice = rs.getString("ProductPrice");
                int count = 0;
                String price = "";
                String temp = "";
                String a[] = getPrice.split("");
                for (int i = getPrice.length() - 1; i >= 0; i--) {
                    count++;
                    temp = temp + a[i];
                    if (count == 3) {
                        count = 0;
                        price = price + temp + ".";
                        temp = "";
                    }
                }
                if (!temp.isEmpty()) {
                    price = price + temp;
                }
                String result = "";
                for (int i = price.length() - 1; i >= 0; i--) {
                    result = result + price.charAt(i);
                }

                p.setProductPrice(result);
                p.setStorage(rs.getString("Storage"));
                String img = "..\\"+rs.getString("Image");
                p.setImage(img);
                p.setCategory_groupID(rs.getString("CGID"));
                listP.add(p);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(GetDataDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listP;
    }
    
    
  
    
    

//    public ArrayList<ImgProducts> getImage() {
//        ArrayList<ImgProducts> listImg = new ArrayList<>();
//
//        try {
//            String sql = "SELECT "
//                    + "      [CGID]\n"
//                    + "      ,[URLImage]\n"
//                    + "  FROM [Zshop].[dbo].[ImageProduct]";
//            PreparedStatement statement = connection.prepareStatement(sql);
//            ResultSet rs = statement.executeQuery();
//            while (rs.next()) {
//                ImgProducts ig = new ImgProducts();
//                ig.setCategory_groupID(rs.getString("CGID"));
//                ig.setImg(rs.getString("URLImage"));
//                listImg.add(ig);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(GetDataDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return listImg;
//    }

}
