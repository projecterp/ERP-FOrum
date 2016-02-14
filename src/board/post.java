package board;

import javax.persistence.Entity;
@Entity
public class post {

	private String str;
    private int no;
	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
}
