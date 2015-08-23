package cn.zsey.webapp;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import cn.zsey.bean.employee.Employee;
import cn.zsey.common.Constants;
import cn.zsey.common.MD5;
import cn.zsey.dao.system.EmployeeDAO;

public class LoginAction extends BaseActionSupport {
	public void checkCode() {
		try {
			BufferedImage buffimg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			Graphics2D g = buffimg.createGraphics();

			Random random = new Random();
			g.setColor(Color.white);
			g.fillRect(0, 0, width, height);

			Font font = new Font("times new roman", Font.PLAIN, 22);
			g.setFont(font);

			g.setColor(Color.gray);
			g.drawRect(0, 0, width - 1, height - 1);

			g.setColor(Color.gray);
			for (int i = 0; i < 18; i++) {
				int x = random.nextInt(width);
				int y = random.nextInt(height);
				int xl = random.nextInt(12);
				int yl = random.nextInt(12);
				g.drawLine(x, y, x + xl, y + yl);
			}

			StringBuffer randomcode = new StringBuffer();
			int red = 0, green = 0, blue = 0;

			for (int i = 0; i < 4; i++) {
				String[] codes = { "A", "B", "C", "D", "E", "F", "G", "H", "I",
						"J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
						"U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4",
						"5", "6", "7", "8", "9" };
				String strrand = codes[random.nextInt(36)];

				red = random.nextInt(200);
				green = random.nextInt(200);
				blue = random.nextInt(200);

				float imght = 0;
				while (imght <= 12) {
					imght = Float.parseFloat(String.valueOf(random.nextInt(height)));
				}
				g.setColor(new Color(red, green, blue));
				g.drawString(strrand, 11 * i + 6, imght);

				randomcode.append(strrand);
			}
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("checkCode", randomcode.toString());
			response=ServletActionContext.getResponse();
			response.setHeader("pragma", "no-cache");
			response.setHeader("cache-control", "no-cache");
			response.setDateHeader("expires", 0);
			response.setContentType("image/jpeg");

			ServletOutputStream sos = response.getOutputStream();
			ImageIO.write(buffimg, "jpeg", sos);
			sos.close();
		} catch (Exception e) {
			e.printStackTrace(System.out);
		}
	}

	@Override
	public String index() {
		return Constants.INDEX;
	}
	
	public String login() {
		return redirect("/main/index.jhtml");
	}
	
	public void validateLogin() {
		if (StringUtils.isEmpty(username)) {
			this.addFieldError("username", "用户名不能为空");
		}
		
		if (StringUtils.isEmpty(password)) {
			this.addFieldError("password", "密码不能为空");
		}
		
		if(StringUtils.isNotEmpty(username) && StringUtils.isNotEmpty(password)){
			MD5 md5=new MD5();
			String md5pwd = md5.getMD5ofStr(password);
			Employee employee = employeeDAO.login(username, md5pwd);
			
			if(md5pwd == null){
				this.addFieldError("username", "用户名或密码不正确");
			}else{
				HttpSession session=ServletActionContext.getRequest().getSession();
				session.setAttribute(Constants.DEFAULT_USER_LOGIN, employee);
			}
		}else{
			this.addFieldError("username", "用户名不正确");
			this.addFieldError("password", "密码不正确");
		}
		this.setInputResult(Constants.INDEX);
	}
	
	public String logout() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.removeAttribute(Constants.DEFAULT_USER_LOGIN);
		return redirectSuccess("/login/index.jhtml?rnd="+Math.random(), "系统退出成功");
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

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	private String username;
	private String password;
	private String checkCode;
	private HttpServletResponse response;
	private HttpServletRequest request;
	private int width = 66;
	private int height = 32;
	@Resource
	private EmployeeDAO employeeDAO;
	private static final long serialVersionUID = 3350921852489479314L;

}
