/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

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
            String sql = "select ProductID,ProductName,ProductPrice,Storage,CGID from Products";
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
                p.setCategory_groupID(rs.getString("CGID"));
                listProduct.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GetDataDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProduct;
    }

    @Override
    public ArrayList getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
