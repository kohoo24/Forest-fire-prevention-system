package kr.co.kung.modelExam;

public class ProductsDTO {
    private String plantsname;
    private String description;
    private int price;
    private int stock;
    private String imageUrl; // 이미지 경로 필드 추가
    
    public ProductsDTO(String plantsname, String description, int price, int stock, String imageUrl) {
		super();
		this.plantsname = plantsname;
		this.description = description;
		this.price = price;
		this.stock = stock;
		this.imageUrl = imageUrl;
	}
    
    public ProductsDTO() {
    	super();
    }

    // Getters and Setters
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

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}