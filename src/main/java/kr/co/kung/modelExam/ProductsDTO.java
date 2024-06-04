package kr.co.kung.modelExam;

public class ProductsDTO {
	private String plantsname;
	private String description;
	private int price;
	private int stock;
	
	
	public ProductsDTO(String plantsname, String description, int price, int stock) {
		super();
		this.plantsname = plantsname;
		this.description = description;
		this.price = price;
		this.stock = stock;
	}
	public ProductsDTO() {
		super();
	}
	public String getPlantsname() {
		return plantsname;
	}
	public void setPlantsname(String plantsname) {
		this.plantsname = plantsname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
}
