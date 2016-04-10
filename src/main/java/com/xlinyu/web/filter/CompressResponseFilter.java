package com.xlinyu.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.htmlcompressor.compressor.HtmlCompressor;

public class CompressResponseFilter implements Filter {

	private HtmlCompressor compressor;

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {

		CharResponseWrapper responseWrapper = new CharResponseWrapper((HttpServletResponse) resp);

		chain.doFilter(req, responseWrapper);
		String content = responseWrapper.toString();
		
//		System.out.println(content);
		String compressContent = new String(content);
//		PrintWriter out = resp.getWriter();
		compressContent = compressor.compress(compressContent);
//		System.out.println(compressor.compress(compressContent));
//		out.write(compressor.compress(compressContent));
//		out.flush();
//		out.close();
		ServletOutputStream outputStream = resp.getOutputStream();
		outputStream.write(compressContent.getBytes());
		return;
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		compressor = new HtmlCompressor();
		compressor.setCompressCss(true);
		compressor.setCompressJavaScript(true);
	}

	@Override
	public void destroy() {
	}

}
