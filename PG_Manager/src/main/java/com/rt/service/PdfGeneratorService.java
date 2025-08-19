package com.rt.service;

import java.io.IOException;
import java.util.List;

import com.rt.entity.Bill;

public interface PdfGeneratorService {

	 byte[] generateBillPdf(List<Bill> bills) throws Exception;

	byte[] generateBillPdfFromTemplate(Bill bill) throws IOException;
}
