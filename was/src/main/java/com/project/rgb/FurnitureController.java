package com.project.rgb;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dto.ImageDTO;
import dto.ProductDTO;
import furnitureManagement.FurnitureService;

@Controller
public class FurnitureController {
	@Autowired
	FurnitureService furnitureService;

	@Resource(name = "defaultPath")
	private String defaultPath;

	@RequestMapping(value = "/getFurnitureList", method = RequestMethod.GET)
	public String list(Model model) {
		try {
			List<Object[]> list = furnitureService.getList();
			model.addAttribute("list", list);
			model.addAttribute("proLen", list.size());
			return "/furniture/FurnitureListView";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getFurniture", method = RequestMethod.GET)
	public String get(@RequestParam(value = "id") int id, Model model) {
		try {
			Object[] obj = furnitureService.get(id);
			ProductDTO productDTO = (ProductDTO) obj[0];
			ArrayList<ImageDTO> imageList = (ArrayList<ImageDTO>) obj[1];
			
			model.addAttribute("product", productDTO);
			model.addAttribute("imageList", imageList);
		
			return "/furniture/FurnitureView";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(@RequestParam("product") String word, Model model) {
		System.out.println("word" + word);
		List<Object[]> list;
		try {
			StringTokenizer st = new StringTokenizer(word, "_");
			int id;
			String code = st.nextToken();
			if (st.hasMoreTokens()) {
				String name = st.nextToken();
				if (code.equals("category")) {
					id = 1;
				} else if (code.equals("brand")) {
					id = 2;
				} else if (code.equals("price")) {
					id = 3;
				} else if (code.equals("color")) {
					id = 4;
				} else if (code.equals("sort")) {
					id = 5;
				} else {
					id = -1;
				}
				list = furnitureService.search(id, name);
			} else {
				id = -1;
				list = furnitureService.search(id, word);
			}
			model.addAttribute("proLen", list.size());
			model.addAttribute("list", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "/furniture/FurnitureListView";
	}

	@RequestMapping(value = "/insertArrangeInfo", method = RequestMethod.POST)
	public String getArrangeInfoPage(@ModelAttribute("productId") int productId,
			@ModelAttribute("productName") String productName, Model model) {
		model.addAttribute("productId", productId);
		model.addAttribute("productName", productName);

		return "/furniture/insertInfo";
	}
}
