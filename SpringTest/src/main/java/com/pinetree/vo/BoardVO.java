package com.pinetree.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BoardVO {
	private int pt_num;
	private String pt_title;
	private String pt_cont;
	private int pt_hit;
	private String date;
	private String pt_img_url;
	private String email;
}
