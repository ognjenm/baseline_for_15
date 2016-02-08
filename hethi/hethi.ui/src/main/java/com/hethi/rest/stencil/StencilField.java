package com.hethi.rest.stencil;

public class StencilField {

	private String name;

	private String coords;

	public StencilField() {

	}

	public StencilField(String name, String coords) {
		this.name = name;

		this.coords = coords;

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCoords() {
		return coords;
	}

	public void setCoords(String coords) {
		this.coords = coords;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer();

		sb.append(getName());
		sb.append(getCoords());

		return sb.toString();
	}
}
