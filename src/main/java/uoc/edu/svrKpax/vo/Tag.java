package uoc.edu.svrKpax.vo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.ManyToOne;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@XmlRootElement
@Entity
@Table(name = "Tag")
public class Tag implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idTag;
	private String tag;
	
	private Game game;

	@Id
	@Column(name = "idTag")
	public int getIdTag() {
		return idTag;
	}

	public void setIdTag(int idTag) {
		this.idTag = idTag;
	}
	
	@Column(name = "tag")
	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}
	
	@Fetch(FetchMode.SELECT) 
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idGame")
	@JsonIgnore
	public Game getGame() {
	    return this.game;
	}

	public void setGame(Game game) {
	    this.game = game;
	}
}