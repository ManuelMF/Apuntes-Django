import java.io.Serializable;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Fecha extends Date implements Serializable {

	private static final long serialVersionUID = -2215777931813024724L;
	private static SimpleDateFormat dma=new SimpleDateFormat("dd/MM/yyyy");
	private static SimpleDateFormat dmahm=new SimpleDateFormat("dd/MM/yyyy HH:mm");
	private static SimpleDateFormat dmahms=new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	
	public Fecha() {
		super();
	}
	
	public Fecha(String f) throws ParseException {
		super();
		
		try {
			this.setDMAHMS(f);
		} catch(ParseException e) {
			try {
				this.setDMAHM(f);
			} catch(ParseException e2) {
				this.setDMA(f);
			}
		}
	}
	
	public Fecha(Timestamp f) throws ParseException {
		super();
		this.setTime(f.getTime());
	}
	
	public Fecha(java.sql.Date f) throws ParseException {
		super();
		this.setTime(f.getTime());
	}
	
	public java.sql.Date getDateMysql() {
		return new java.sql.Date(this.getTime());
	}
	
	public Timestamp getTimeMysql() {
		return new Timestamp(this.getTime());
	}
	
	
	public String getDMA() {
		return Fecha.dma.format(this);
	}
	
	public String getDMAHM() {
		return Fecha.dmahm.format(this);
	}
	
	public String getDMAHMS() {
		return Fecha.dmahms.format(this);
	}
	
	public void setDMA(String f) throws ParseException {
		Date d=Fecha.dma.parse(f);
		this.setTime(d.getTime());
	}
	
	public void setDMAHM(String f) throws ParseException {
		Date d=Fecha.dmahm.parse(f);
		this.setTime(d.getTime());
	}
	
	public void setDMAHMS(String f) throws ParseException {
		Date d=Fecha.dmahms.parse(f);
		this.setTime(d.getTime());
	}

	
}
