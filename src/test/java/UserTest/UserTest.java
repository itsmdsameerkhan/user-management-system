/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserTest;

import com.conquerors.usermanagementsystem.ConnectDB;
import com.conquerors.usermanagementsystem.dao.UserDao;
import com.conquerors.usermanagementsystem.model.User;
import java.sql.Connection;

import org.junit.*;
import static org.junit.Assert.*;


public class UserTest {

    @Before
    public void setUp() throws Exception {
    }

    @Test
    public void testUser() throws ClassNotFoundException {
        User user = new User();
        UserDao daoUser = new UserDao();

        user.setFirst_name("Shyam");
        user.setLast_name("Ghansyam");
        user.setEmail("shyam@ghansyam.com");
        user.setUsername("shyam");
        user.setPassword("shyam123");
        user.setBirth_date("2000-10-2");
        user.setPhone("9823165498");
        user.setId(2);
        user.setIsAdmin(0);
        user.setIsBlocked(0);

        daoUser.register(user);
        String actual = "Shyam";
        String expected = user.getFirst_name();

        if (actual.equals(expected)) {
            assertTrue(true);
        } else {
            assertTrue(false);
        }
    }
    
    @Test
    public void testWithNull() throws ClassNotFoundException {
        User user = new User();
        UserDao daoUser = new UserDao();

        user.setFirst_name("Shyam");
        user.setLast_name("Ghansyam");
        user.setEmail("shyam@ghansyam.com");
        user.setUsername("shyam");
        user.setPassword("shyam123");
        user.setBirth_date("");
        user.setPhone("9823165498");
        user.setId(2);
        user.setIsAdmin(0);
        user.setIsBlocked(0);

        daoUser.register(user);
        String expected = user.getBirth_date();

        if (expected.isEmpty()) {
            assertTrue(true);
        } else {
            assertTrue(false);
        }
    }
    
    @Test
    public void testDBConnection() throws Exception {
        Connection conn = ConnectDB.getConnection();
        if (conn != null) {
            assertTrue(true);
        } else {
            assertTrue(false);
        }
    }

    //    @Test
//    public void testValidateUser() throws Exception {
//        System.out.println("Validate with blocked user");
//        String username = "ramkrishna";
//        String password = "haha";
//        User expResult = null;
//        User result = UserDao.login(email, password);
//        assertEquals(expResult, result);
////        fail("The test case is a prototype.");
//    }
    
    
//    
//    @org.junit.Test
//    public void testBlockUser() throws Exception{
//        System.out.println("blockUser");
//        int id= 2;
//        UserDao instance = new UserDao();
//        instance.blockUser(id);
//        User user = instance.userDetails(id);
//        
//        if (user.getIsBlocked() ==1){
//        assertTrue(true);
//        }else{
//        assertTrue(false);
//        }
//    
//    }
//
//
// @Test
//   public void testUnblockUser() throws Exception{
//     System.out.println("UnblockUser");
//      int id= 2;
//        UserDao instance = new UserDao();
//       instance.unblockUser(id);
//       User user = instance.userDetails(id);
//        
//       if (user.getIsBlocked() ==0){
//        assertTrue(true);
//        }else{
//        assertTrue(false);
//        }
//   }
    
}
