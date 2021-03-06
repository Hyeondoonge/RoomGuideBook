package cartManagement;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.CartDTO;

@Service("cartService")
public class CartService {

   @Autowired
   CartDAO cartDAO;

   public List<Object[]> getList(String id) throws SQLException {
      return cartDAO.getList(id);
   }

   public void register(CartDTO cartDTO) throws SQLException {
      cartDAO.register(cartDTO);
   }

   public void delete(String[] list, String memberId) throws SQLException {
      cartDAO.delete(list, memberId);
   }
}