package com.outflearn.Outflearn.dto;

import org.springframework.stereotype.Service;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Service
public class FileValidator implements Validator {

   @Override
   public boolean supports(Class<?> arg0) {
      return false;
   }

   @Override
   public void validate(Object uploadFile, Errors errors) {
      FileUpload file = (FileUpload) uploadFile;
      
      if(file.getFile().getSize() == 0) {
         errors.rejectValue("file", "errorCode", 
               "Please select a file");
      }
   }
}