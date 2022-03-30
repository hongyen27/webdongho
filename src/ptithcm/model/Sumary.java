package ptithcm.model;

public class Sumary {
	private int id;
	private String name;
	private double price;
	private int sl;
	private float phantram;
	private float tong;
	public Sumary() {
		super();
	}
	public Sumary(int id, String name, double price, int sl, float phantram, float tong) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.sl = sl;
		this.phantram = phantram;
		this.tong = tong;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getSl() {
		return sl;
	}
	public void setSl(int sl) {
		this.sl = sl;
	}
	public float getPhantram() {
		return phantram;
	}
	public void setPhantram(float phantram) {
		this.phantram = phantram;
	}
	public float getTong() {
		return tong;
	}
	public void setTong(float tong) {
		this.tong = tong;
	}
	@Override
	public String toString() {
		return "Sumary [id=" + id + ", name=" + name + ", price=" + price + ", sl=" + sl + ", phantram=" + phantram
				+ ", tong=" + tong + "]";
	}

}
