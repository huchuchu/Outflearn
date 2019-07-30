package com.outflearn.Outflearn.dto;

public class ClassInfoDto {
   
   private int class_num;
   private String class_title;
   private String class_author;
   private String class_intro;
   private int class_rating;
   private int class_price;
   private int class_subcount;
   private String class_studentlevel;
   private String class_category;
   
   public ClassInfoDto() {
      
   }
   
   public ClassInfoDto(int class_num, String class_title, String class_author, String class_intro, int class_rating,
         int class_price, int class_subcount, String class_studentlevel ,String class_category) {
      super();
      this.class_num = class_num;
      this.class_title = class_title;
      this.class_author = class_author;
      this.class_intro = class_intro;
      this.class_rating = class_rating;
      this.class_price = class_price;
      this.class_subcount = class_subcount;
      this.class_studentlevel = class_studentlevel;
      this.class_category = class_category;
   }
   
   public int getClass_num() {
      return class_num;
   }
   public void setClass_num(int class_num) {
      this.class_num = class_num;
   }
   public String getClass_title() {
      return class_title;
   }
   public void setClass_title(String class_title) {
      this.class_title = class_title;
   }
   public String getClass_author() {
      return class_author;
   }
   public void setClass_author(String class_author) {
      this.class_author = class_author;
   }
   public String getClass_intro() {
      return class_intro;
   }
   public void setClass_intro(String class_intro) {
      this.class_intro = class_intro;
   }
   public int getClass_rating() {
      return class_rating;
   }
   public void setClass_rating(int class_rating) {
      this.class_rating = class_rating;
   }
   public int getClass_price() {
      return class_price;
   }
   public void setClass_price(int class_price) {
      this.class_price = class_price;
   }
   public int getClass_subcount() {
      return class_subcount;
   }
   public void setClass_subcount(int class_subcount) {
      this.class_subcount = class_subcount;
   }
   public String getClass_studentlevel() {
      return class_studentlevel;
   }
   public void setClass_studentlevel(String class_studentlevel) {
      this.class_studentlevel = class_studentlevel;
   }
   public String getClass_category() {
      return class_category;
   }
   public void setClass_category(String class_category) {
      this.class_category = class_category;
   }
   
   
}