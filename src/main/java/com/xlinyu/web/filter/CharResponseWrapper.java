package com.xlinyu.web.filter;

import java.io.CharArrayWriter;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class CharResponseWrapper extends HttpServletResponseWrapper {

	private final CharArrayWriter output;

	@Override
	public String toString() {
		return output.toString();
	}

	public CharResponseWrapper(HttpServletResponse response) {
		super(response);
		output = new CharArrayWriter();
		output.flush();
		output.close();
	}

	@Override
	public PrintWriter getWriter() {
		return new PrintWriter(output);
	}

}