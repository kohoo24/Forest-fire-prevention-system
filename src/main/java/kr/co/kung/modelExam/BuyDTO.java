// BuyDTO.java

package kr.co.kung.modelExam;

import java.util.Date;

public class BuyDTO {
    private String userid;
    private String plantsname;
    private int quantity;
    private Date purchaseTime;

    // 생성자, getter 및 setter 생략

    // 각 필드의 getter 및 setter 메서드 구현
    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getPlantsname() {
        return plantsname;
    }

    public void setPlantsname(String plantsname) {
        this.plantsname = plantsname;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getPurchaseTime() {
        return purchaseTime;
    }

    public void setPurchaseTime(Date purchaseTime) {
        this.purchaseTime = purchaseTime;
    }
}
