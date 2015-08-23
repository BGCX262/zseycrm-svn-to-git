package cn.zsey.common;

/**
 * 系统常用参数和枚举型对象
 * 
 * @author 杜永生
 * 
 */
public class PublicType {
	public static enum Sex {
		MALE("男"),
		FEMALE("女");

		private String text;

		public String getText() {
			return this.text;
		}

		private Sex(String str) {
			this.text = str;
		}
	}
	
	/**
	 * 血型
	 * @author 杜永生
	 *
	 */
	public static enum BloodSort {
		A("A型"),
		B("B型"),
		AB("AB型"),
		O("O型"),
		OTHER("其他血型");
		
		private String text;
		
		public String getText() {
			return this.text;
		}
		
		private BloodSort(String str) {
			this.text = str;
		}
	}
	
	/**
	 * 学历
	 * @author 杜永生
	 *
	 */
	public static enum Degree {
		D1("博士后"),
		D2("博士"),
		D3("MBA"),
		D4("硕士"),
		D5("本科"),
		D6("大专"),
		D7("高中"),
		D8("中专"),
		D9("技校"),
		D10("职高"),
		D11("理工"),
		D12("初中"),
		D13("小学"),
		D14("文盲");
		
		private String text;
		
		public String getText() {
			return this.text;
		}
		
		private Degree(String str) {
			this.text = str;
		}
	}
	
	
	public static enum ManSort{
		CUSTOMER("客户"),
		PROVIDER("供应商"),
		RELATION("亲属"),
		EMPLOYEE("员工");
		
		private String text;
		
		public String getText(){
			return this.text;
		}
		
		private ManSort(String str){
			this.text = str;
		}
	}
	
	public static enum OrderGrade{
		GENERAL("常规"),
		FAST("急"),
		FASTER("特急");
		
		private String text;
		
		public String getText(){
			return this.text;
		}
		
		private OrderGrade(String str){
			this.text = str;
		}
	}
	
	
	public static enum PlanSort{
		PM("月计划"),
		PS("季度计划"),
		PY("年度计划");
		
		private String text;
		
		public String getText(){
			return this.text;
		}
		
		private PlanSort(String str){
			this.text = str;
		}
	}
	
	public static enum AskStyle{
		MEET("当面"),
		PHONE("电话"),
		FAX("传真"),
		EXPRESS("快递"),
		POST("邮件"),
		LETTER("信函"),
		OTHER("其他");
		
		private String text;
		
		public String getText(){
			return this.text;
		}
		
		private AskStyle(String str){
			this.text = str;
		}
	}
	
	
	
	public static enum AuditState {
		AUDIT_WAIT("待审核"),
		AUDIT_NO("不通过"),
		AUDIT_YES("通过"),
		AUDIT_OK("已确认");
		
		private String text;
		
		public String getText(){
			return this.text;
		}
		
		private AuditState(String str){
			this.text = str;
		}
	}
	
	/**
	 * 产品分类
	 * @author 杜永生
	 *
	 */
	public static enum ProductType {
		INSIDE("内部"),
		OUTSIDE("外部");
		
		private String text;
		
		public String getText() {
			return this.text;
		}
		
		private ProductType(String str) {
			this.text = str;
		}
	}
	
	
	/**
	 * 公共类型
	 * @author 杜永生
	 *
	 */
	public static enum Sort{
		MATERIAL("物料"),
		PRODUCT("产品"),
		WORK("工序"),
		COST("成本"),
		WAGE("人工"),
		AREA("地区"),
		CUSTOMER("客户类型"),
		CERTIFICATE("证件类型"),
		DUTY("职务"),
		PLAN("计划"),
		RECEIPT("票据"),
		CONTRACT("合同"),
		SELL("销售类型"),
		PAY("支付方式"),
		ASK("报价/询价方式"),
		CONTACT("联系方式"),
		PLOY("活动类型"),
		UNIT("单位"),
		NATION("民族"),
		POLITY("政治面貌"),
		OTHER("其他");
		
		private String text;
		
		public String getText() {
			return this.text;
		}
		
		private Sort(String str) {
			this.text = str;
		}
	}
	
}
