package com.rt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import com.rt.entity.Tenant;
import com.rt.service.TenantService;

import javax.validation.Valid;

import java.io.File;
import java.io.IOException;

@Controller
public class NoticeController {

    @Autowired
    private TenantService tenantService;

    
  
}
