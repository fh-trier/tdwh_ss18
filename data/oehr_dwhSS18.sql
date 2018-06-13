/*==============================================================*/
/* DBMS name:      ORACLE Version 12c                           */
/* Created on:     24.03.2016 20:08:37                          */
/*==============================================================*/
prompt Tabellen und Constraints loeschen...
set feedback off
set define off

alter table CATEGORIES_TAB
   drop constraint FK_CATEGORI_REFERENCE_CATEGORI;

alter table COUNTRIES
   drop constraint FK_COUNTRIE_REFERENCE_REGIONS;

alter table CUSTOMERS
   drop constraint FK_CUSTOMER_REFERENCE_EMPLOYEE;

alter table CUSTOMERS
   drop constraint FK_CUSTOMER_REFERENCE_COUNTRIE;

alter table DEPARTMENTS
   drop constraint FK_DEPARTME_REFERENCE_LOCATION;

alter table EMPLOYEES
   drop constraint FK_EMPLOYEE_REFERENCE_DEPARTME;

alter table EMPLOYEES
   drop constraint FK_EMPLOYEE_REFERENCE_JOBS;

alter table JOB_HISTORY
   drop constraint FK_JOB_HIST_REFERENCE_EMPLOYEE;

alter table JOB_HISTORY
   drop constraint FK_JOB_HIST_REFERENCE_JOBS;

alter table LOCATIONS
   drop constraint FK_LOCATION_REFERENCE_COUNTRIE;

alter table ORDERS
   drop constraint FK_ORDERS_REFERENCE_EMPLOYEE;

alter table ORDERS
   drop constraint FK_ORDERS_REFERENCE_CHANNELS;

alter table ORDERS
   drop constraint FK_ORDERS_REFERENCE_CUSTOMER;

alter table ORDER_ITEMS
   drop constraint FK_ORDER_IT_REFERENCE_ORDERS;

alter table ORDER_ITEMS
   drop constraint FK_ORDER_IT_REFERENCE_PRODUCT_;

alter table PRODUCT_INFORMATION
   drop constraint FK_PRODUCT__REFERENCE_CATEGORI;

drop table CATEGORIES_TAB cascade constraints;

drop table CHANNELS cascade constraints;

drop table COUNTRIES cascade constraints;

drop table CUSTOMERS cascade constraints;

drop table DEPARTMENTS cascade constraints;

drop table EMPLOYEES cascade constraints;

drop table JOBS cascade constraints;

drop table JOB_HISTORY cascade constraints;

drop table LOCATIONS cascade constraints;

drop table ORDERS cascade constraints;

drop table ORDER_ITEMS cascade constraints;

drop table PRODUCT_INFORMATION cascade constraints;

drop table REGIONS cascade constraints;

prompt Tabellen anlegen...
/*==============================================================*/
/* Table: CATEGORIES_TAB                                        */
/*==============================================================*/
create table CATEGORIES_TAB (
   CATEGORY_ID          NUMBER(2,0)           not null,
   CATEGORY_NAME        VARCHAR2(50 BYTE),
   CATEGORY_DESCRIPTION VARCHAR2(1000 BYTE),
   PARENT_CATEGORY_ID   NUMBER(2,0),
   constraint PK_CATEGORIES_TAB primary key (CATEGORY_ID)
);

/*==============================================================*/
/* Table: CHANNELS                                              */
/*==============================================================*/
create table CHANNELS (
   CHANNEL_ID           NUMBER                not null,
   CHANNEL_DESC         VARCHAR2(20 BYTE),
   CHANNEL_CLASS        VARCHAR2(20 BYTE),
   CHANNEL_CLASS_ID     NUMBER,
   CHANNEL_TOTAL        VARCHAR2(13 BYTE),
   CHANNEL_TOTAL_ID     NUMBER,
   constraint PK_CHANNELS primary key (CHANNEL_ID)
);

/*==============================================================*/
/* Table: COUNTRIES                                             */
/*==============================================================*/
create table COUNTRIES (
   COUNTRY_ID           CHAR(2)               not null,
   COUNTRY_NAME         VARCHAR2(40 BYTE),
   REGION_ID            NUMBER,
   constraint PK_COUNTRIES primary key (COUNTRY_ID)
);

/*==============================================================*/
/* Table: CUSTOMERS                                             */
/*==============================================================*/
create table CUSTOMERS (
   CUSTOMER_ID          NUMBER(6,0)           not null,
   CUST_FIRST_NAME  VARCHAR2(20 BYTE),
   CUST_LAST_NAME   VARCHAR2(20 BYTE),
   PHONE_NUMBER        VARCHAR2(50 BYTE),
   NLS_LANGUAGE         VARCHAR2(3 BYTE),
   NLS_TERRITORY        VARCHAR2(30 BYTE),
   CREDIT_LIMIT         NUMBER(9,2),
   CUST_EMAIL           VARCHAR2(40 BYTE),
   ACCOUNT_MGR_ID       NUMBER(6,0),
   CUST_GEO_LOCATION    NUMBER(38,0),
   DATE_OF_BIRTH        DATE,
   MARITAL_STATUS       VARCHAR2(20 BYTE),
   GENDER               VARCHAR2(1 BYTE),
   INCOME_LEVEL         VARCHAR2(20 BYTE),
   CUST_ADDRESS         VARCHAR2(60 BYTE),
   COUNTRY_ID           CHAR(2),
   constraint PK_CUSTOMERS primary key (CUSTOMER_ID)
);

/*==============================================================*/
/* Table: DEPARTMENTS                                           */
/*==============================================================*/
create table DEPARTMENTS (
   DEPARTMENT_ID        NUMBER(4,0)           not null,
   DEPARTMENT_NAME      VARCHAR2(30 BYTE),
   MANAGER_ID           NUMBER(6,0),
   LOCATION_ID          NUMBER(4,0),
   constraint PK_DEPARTMENTS primary key (DEPARTMENT_ID)
);

/*==============================================================*/
/* Table: EMPLOYEES                                             */
/*==============================================================*/
create table EMPLOYEES (
   EMPLOYEE_ID          NUMBER(6,0)           not null,
   FIRST_NAME           VARCHAR2(20 BYTE),
   LAST_NAME            VARCHAR2(25 BYTE),
   EMAIL                VARCHAR2(25 BYTE),
   PHONE_NUMBER         VARCHAR2(20 BYTE),
   HIRE_DATE            DATE,
   JOB_ID               VARCHAR2(10 BYTE),
   SALARY               NUMBER(8,2),
   COMMISSION_PCT       NUMBER(2,2),
   MANAGER_ID           NUMBER(6,0),
   DEPARTMENT_ID        NUMBER(4,0),
   constraint PK_EMPLOYEES primary key (EMPLOYEE_ID)
);

/*==============================================================*/
/* Table: JOBS                                                  */
/*==============================================================*/
create table JOBS (
   JOB_ID               VARCHAR2(10 BYTE)     not null,
   JOB_TITLE            VARCHAR2(35 BYTE),
   MIN_SALARY           NUMBER(6,0),
   MAX_SALARY           NUMBER(6,0),
   constraint PK_JOBS primary key (JOB_ID)
);

/*==============================================================*/
/* Table: JOB_HISTORY                                           */
/*==============================================================*/
create table JOB_HISTORY (
   EMPLOYEE_ID          NUMBER(6,0)           not null,
   START_DATE           DATE                  not null,
   END_DATE             DATE,
   JOB_ID               VARCHAR2(10 BYTE),
   DEPARTMENT_ID        NUMBER(4,0),
   constraint PK_JOB_HISTORY primary key (EMPLOYEE_ID, START_DATE)
);

/*==============================================================*/
/* Table: LOCATIONS                                             */
/*==============================================================*/
create table LOCATIONS (
   LOCATION_ID          NUMBER(4,0)           not null,
   STREET_ADDRESS       VARCHAR2(40 BYTE),
   POSTAL_CODE          VARCHAR2(12 BYTE),
   CITY                 VARCHAR2(30 BYTE),
   STATE_PROVINCE       VARCHAR2(25 BYTE),
   COUNTRY_ID           CHAR(2 BYTE),
   constraint PK_LOCATIONS primary key (LOCATION_ID)
);

/*==============================================================*/
/* Table: ORDERS                                                */
/*==============================================================*/
create table ORDERS (
   ORDER_ID             NUMBER(12,0)          not null,
   ORDER_DATE           TIMESTAMP,
   CHANNEL_ID           NUMBER,
   CUSTOMER_ID          NUMBER(6,0),
   ORDER_STATUS         NUMBER(2,0),
   ORDER_TOTAL          NUMBER(8,2),
   SALES_REP_ID         NUMBER(6,0),
   PROMOTION_ID         NUMBER(6,0),
   constraint PK_ORDERS primary key (ORDER_ID)
);

/*==============================================================*/
/* Table: ORDER_ITEMS                                           */
/*==============================================================*/
create table ORDER_ITEMS (
   ORDER_ID             NUMBER(12,0)          not null,
   LINE_ITEM_ID         NUMBER(3,0)           not null,
   PRODUCT_ID           NUMBER(6,0)           not null,
   UNIT_PRICE           NUMBER(8,2),
   QUANTITY             NUMBER(8,0),
   constraint PK_ORDER_ITEMS primary key (ORDER_ID, LINE_ITEM_ID)
);

/*==============================================================*/
/* Table: PRODUCT_INFORMATION                                   */
/*==============================================================*/
create table PRODUCT_INFORMATION (
   PRODUCT_ID           NUMBER(6,0)           not null,
   PRODUCT_NAME         VARCHAR2(50 BYTE),
   PRODUCT_DESCRIPTION  VARCHAR2(2000 BYTE),
   CATEGORY_ID          NUMBER(2,0),
   WEIGHT_CLASS         NUMBER(1,0),
   WARRANTY_PERIOD      INTERVAL YEAR (2) TO MONTH,
   SUPPLIER_ID          NUMBER(6,0),
   PRODUCT_STATUS       VARCHAR2(20 BYTE),
   LIST_PRICE           NUMBER(8,2),
   MIN_PRICE            NUMBER(8,2),
   CATALOG_URL          VARCHAR2(50BYTE),
   constraint PK_PRODUCT_INFORMATION primary key (PRODUCT_ID)
);

/*==============================================================*/
/* Table: REGIONS                                               */
/*==============================================================*/
create table REGIONS (
   REGION_ID            NUMBER                not null,
   REGION_NAME          VARCHAR2(25 BYTE),
   constraint PK_REGIONS primary key (REGION_ID)
);

prompt Constraints anlegen...
alter table CATEGORIES_TAB
   add constraint FK_CATEGORI_REFERENCE_CATEGORI foreign key (PARENT_CATEGORY_ID)
      references CATEGORIES_TAB (CATEGORY_ID);

alter table COUNTRIES
   add constraint FK_COUNTRIE_REFERENCE_REGIONS foreign key (REGION_ID)
      references REGIONS (REGION_ID);

alter table CUSTOMERS
   add constraint FK_CUSTOMER_REFERENCE_EMPLOYEE foreign key (ACCOUNT_MGR_ID)
      references EMPLOYEES (EMPLOYEE_ID);

alter table CUSTOMERS
   add constraint FK_CUSTOMER_REFERENCE_COUNTRIE foreign key (COUNTRY_ID)
      references COUNTRIES (COUNTRY_ID);

alter table DEPARTMENTS
   add constraint FK_DEPARTME_REFERENCE_LOCATION foreign key (LOCATION_ID)
      references LOCATIONS (LOCATION_ID);

alter table EMPLOYEES
   add constraint FK_EMPLOYEE_REFERENCE_DEPARTME foreign key (DEPARTMENT_ID)
      references DEPARTMENTS (DEPARTMENT_ID);

alter table EMPLOYEES
   add constraint FK_EMPLOYEE_REFERENCE_JOBS foreign key (JOB_ID)
      references JOBS (JOB_ID);

alter table JOB_HISTORY
   add constraint FK_JOB_HIST_REFERENCE_EMPLOYEE foreign key (EMPLOYEE_ID)
      references EMPLOYEES (EMPLOYEE_ID);

alter table JOB_HISTORY
   add constraint FK_JOB_HIST_REFERENCE_JOBS foreign key (JOB_ID)
      references JOBS (JOB_ID);

alter table LOCATIONS
   add constraint FK_LOCATION_REFERENCE_COUNTRIE foreign key (COUNTRY_ID)
      references COUNTRIES (COUNTRY_ID);

alter table ORDERS
   add constraint FK_ORDERS_REFERENCE_EMPLOYEE foreign key (SALES_REP_ID)
      references EMPLOYEES (EMPLOYEE_ID);

alter table ORDERS
   add constraint FK_ORDERS_REFERENCE_CHANNELS foreign key (CHANNEL_ID)
      references CHANNELS (CHANNEL_ID);

alter table ORDERS
   add constraint FK_ORDERS_REFERENCE_CUSTOMER foreign key (CUSTOMER_ID)
      references CUSTOMERS (CUSTOMER_ID);

alter table ORDER_ITEMS
   add constraint FK_ORDER_IT_REFERENCE_ORDERS foreign key (ORDER_ID)
      references ORDERS (ORDER_ID);

alter table ORDER_ITEMS
   add constraint FK_ORDER_IT_REFERENCE_PRODUCT_ foreign key (PRODUCT_ID)
      references PRODUCT_INFORMATION (PRODUCT_ID);

alter table PRODUCT_INFORMATION
   add constraint FK_PRODUCT__REFERENCE_CATEGORI foreign key (CATEGORY_ID)
      references CATEGORIES_TAB (CATEGORY_ID);


prompt Inhalte einfuegen...
/*==============================================================*/
/* INSERT in CATEGORIES_TAB                                   */
/*==============================================================*/
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('online catalog','catalog of computer hardware, software, and office equipment','90',null);
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('hardware','computer hardware and peripherals','10','90');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('software','computer software','20','90');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('office equipment','office furniture and supplies','30','90');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('hardware1','monitors','11','10');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('hardware2','printers','12','10');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('hardware3','harddisks','13','10');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('hardware4','memory components/upgrades','14','10');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('software1','spreadsheet software','21','20');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('software2','word processing software','22','20');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('software3','database software','23','20');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('office1','capitalizable assets (desks, chairs, phones ...)','31','30');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('office2','office supplies for daily use (pencils, erasers, staples, ...)','32','30');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('hardware5','processors, sound and video cards, network cards, motherboards','15','10');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('hardware6','keyboards, mouses, mouse pads','16','10');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('hardware7','other peripherals (CD-ROM, DVD, tape cartridge drives, ...)','17','10');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('hardware8','miscellaneous hardware (cables, screws, power supplies ...)','19','10');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('software4','operating systems','24','20');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('software6','miscellaneous software','29','20');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('office3','manuals, other books','33','30');
Insert into CATEGORIES_TAB (CATEGORY_NAME,CATEGORY_DESCRIPTION,CATEGORY_ID,PARENT_CATEGORY_ID) values ('office4','miscellaneous office supplies','39','30');


/*==============================================================*/
/* INSERT in PRODUCT_INFORMATION                                   */
/*==============================================================*/
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2414','HD 9.1GB @10000 /I','9.1 GB SCSI hard disk @ 10000 RPM (internal). Supra7 disk drives are available in 10,000 RPM spindle speeds and capacities of 18GB and 9.1 GB. SCSI and RS-232 interfaces.','13','3','+05-00','102098','orderable','454','399','http://www.supp-102098.com/cat/hw/p2414.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2272','RAM - 16 MB','Memory SIMM: RAM - 16 MB capacity.','14','1','+01-00','102074','obsolete','135','110','http://www.supp-102074.com/cat/hw/p2272.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('1763','DIMM - 64MB','Memory DIMM: RAM, 64MB (100-MHz Unregistered ECC SDRAM)','14','1','+01-00','102069','orderable','247','202','http://www.supp-102069.com/cat/hw/p1763.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2404','64MB Cache /NM','64 MB Non-mirrored cache memory. FPM memory chips are implemented on 5 volt SIMMs, but are also available on 3.3 volt DIMMs.','14','1','+00-06','102087','orderable','221','180','http://www.supp-102087.com/cat/hw/p2404.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3087','DIMM - 16 MB','Citrus OLX DIMM - 16 MB capacity.','14','1','+00-06','102081','obsolete','124','99','http://www.supp-102081.com/cat/hw/p3087.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('1772','HD 9.1GB @10000','Hard disk drive - 9.1 GB, rated up to 10,000 RPM. These drives are intended for use in data-critical enterprise environments. Ease of doing business: you can easily select the drives you need regardless of the application in which they will be deployed.','13','3','+05-00','102070','orderable','456','393','http://www.supp-102070.com/cat/hw/p1772.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3178','Spreadsheet - SSP/V 2.0','SmartSpread Spreadsheet, Professional Edition Version 2.0, for Vision Release 11.1 and 11.2. Shrink wrap includes CD-ROM containing advanced software and online documentation, plus printed manual, tutorial, and license registration.','21','2','+00-01','103080','orderable','45','37','http://www.supp-103080.com/cat/sw/p3178.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3179','Spreadsheet - SSS/S 2.1','SmartSpread Spreadsheet, Standard Edition Version 2.1, for SPNIX Release 4.0. Shrink wrap includes CD-ROM containing software and online documentation, plus printed manual and license registration.','21','2','+00-01','103080','orderable','50','44','http://www.supp-103080.com/cat/sw/p3179.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3182','Word Processing - SWP/V 4.5','SmartWord Word Processor, Professional Edition Version 4.5, for Vision Release 11.x. Shrink wrap includes CD-ROM, containing advanced software, printed manual, and license registration.','22','2','+00-03','103093','orderable','65','54','http://www.supp-103093.com/cat/sw/p3182.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3183','Word Processing - SWS/V 4.5','SmartWord Word Processor, Standard Edition Version 4.5, for Vision Release 11.x. Shrink wrap includes CD-ROM and license registration.','22','2','+00-01','103093','orderable','50','40','http://www.supp-103093.com/cat/sw/p3183.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2231','Desk - S/V','Standard-sized desk; capitalizable, taxable item. Final finish is from veneer in stock at time of order, including oak, ash, cherry, and mahogany.','31','5','+15-00','103082','orderable','2510','2114','http://www.supp-103082.com/cat/off/p2231.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2335','Mobile phone','Dual band mobile phone with low battery consumption. Lightweight, foldable, with socket for single earphone and spare battery compartment.','31','1','+01-06','103088','orderable','100','83','http://www.supp-103088.com/cat/off/p2335.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2091','Paper Tablet LW 8 1/2 x 11','Paper tablet, lined, white, size 8 1/2 x 11 inch','32','1','+00-00','103095','orderable','1','0','http://www.supp-103095.com/cat/off/p2091.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2093','Pens - 10/FP','Permanent ink pen dries quickly and is smear resistant. Provides smooth, skip-free writing. Fine point. Single color boxes (black, blue, red) or assorted box (6 black, 3 blue, and 1 red).','32','1','+00-00','103090','orderable','8','7','http://www.supp-103090.com/cat/off/p2093.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('1781','CDW 20/48/E','CD Writer, read 48x, write 20x','17','2','+00-09','102060','orderable','233','206','http://www.supp-102060.com/cat/hw/p1781.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('1782','Compact 400/DQ','400 characters per second high-speed draft printer. Dimensions (HxWxD): 17.34 x 24.26 x 26.32 inch. Interface: RS-232 serial (9-pin), no expansion slots. Paper size: A4, US Letter.','12','4','+01-06','102088','obsolete','125','108','http://www.supp-102088.com/cat/hw/p1782.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('1797','Inkjet C/8/HQ','Inkjet printer, color, 8 pages per minute, high resolution (photo quality). Memory: 16MB. Dimensions (HxWxD): 7.3 x 17.5 x 14 inch. Paper size: A4, US Letter, envelopes. Interface: Centronics parallel, IEEE 1284 compliant.','12','3','+02-00','102094','orderable','349','288','http://www.supp-102094.com/cat/hw/p1797.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('1803','SPNIX3.3 - DL','Operating System Software: SPNIX V3.3 - Additional developer license.','24','1','+01-00','103092','orderable','60','51','http://www.supp-103092.com/cat/sw/p1803.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('1808','SPNIX3.3 - UL/D','Operating System Software: SPNIX V3.3 - Additional user license class D.','24','1','+01-00','103092','orderable','55','46','http://www.supp-103092.com/cat/sw/p1808.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2058','Mouse +WP','Combination of a mouse and a wrist pad for more comfortable typing and mouse operation.','16','1','+01-00','102055','orderable','23','19','http://www.supp-102055.com/cat/hw/p2058.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2211','Wrist Pad','A foam strip to support your wrists when using a keyboard','16','1','+01-00','102072','orderable','4','3','http://www.supp-102072.com/cat/hw/p2211.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2245','Monitor 19/SD/M','Monitor 19 (18 Viewable) short depth, Monochrome. Outstanding image performance in a compact design. A simple, on-screen dislay menu helps you easily adjust screen dimensions, colors and image attributes. Just plug your monitor into your PC and you are ready to go.','11','5','+00-09','102053','orderable','512','420','http://www.supp-102053.com/cat/hw/p2245.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2252','Monitor 21/HR/M','Monitor 21 inch (20 viewable) high resolution, monochrome. Unit size: 35.6 x 29.6 x 33.3 cm (14.6 kg) Package: 40.53 x 31.24 x 35.39 cm (16.5 kg). Horizontal frequency 31.5 - 54 kHz, Vertical frequency 50 - 120 Hz. Universal power supply 90 - 132 V, 50 - 60 Hz.','11','5','+01-06','102079','obsolete','889','717','http://www.supp-102079.com/cat/hw/p2252.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2257','HD 8GB /I','8GB capacity hard disk drive (internal). Supra9 hot pluggable hard disk drives provide the ability to install or remove drives on-line. Backward compatibility: You can mix Supra2 and Supra3 devices for optimized solutions and future growth.','13','1','+03-00','102061','orderable','399','338','http://www.supp-102061.com/cat/hw/p2257.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2262','ZIP 100','ZIP Drive, 100 MB capacity (external) plus cable for parallel port connection','17','2','+01-06','102054','orderable','98','81','http://www.supp-102054.com/cat/hw/p2262.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2264','CDW 20/48/I','CD-ROM drive: read 20x, write 48x (internal)','17','2','+00-09','102060','orderable','223','181','http://www.supp-102060.com/cat/hw/p2264.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2268','Modem - 56/H/E','Standard Hayes compatible modem - 56kb per second, external. Power supply: 220V.','17','1','+01-00','102068','obsolete','77','67','http://www.supp-102068.com/cat/hw/p2268.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2274','RAM - 32 MB','Memory SIMM: RAM - 32 MB capacity.','14','1','+01-00','102064','orderable','161','135','http://www.supp-102064.com/cat/hw/p2274.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2276','SDRAM - 48 MB','Memory SIMM: RAM - 48 MB. SDRAM can operate in burst mode. In burst mode, when a single data address is accessed, an entire block of data is retrieved rather than just the one piece. The assumption is that the next piece of data that will be requested will be sequential to the previous. Since this is usually the case, data is held readily available.','14','1','+00-09','102058','orderable','269','215','http://www.supp-102058.com/cat/hw/p2276.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2289','KB 101/ES','Standard PC/AT Enhanced Keyboard (101/102-Key). Input locale: Spanish.','16','1','+01-00','102055','orderable','48','38','http://www.supp-102055.com/cat/hw/p2289.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2293','MB - S600','Motherboard, 600 Series.','15','2','+02-00','102086','orderable','99','87','http://www.supp-102086.com/cat/hw/p2293.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2299','PS 12V /P','Power Supply - 12v portable','19','2','+01-00','102062','orderable','70','64','http://www.supp-102062.com/cat/hw/p2299.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2308','Video Card /E32','3-D ELSA Video Card, with 32 MB memory.','15','2','+00-06','102087','orderable','58','48','http://www.supp-102087.com/cat/hw/p2308.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2311','PS 220V /L','Power supply for laptop computers, 220V','19','2','+00-09','102053','orderable','95','79','http://www.supp-102053.com/cat/hw/p2311.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2316','Screws <S.32.S>','Screws: Steel, size 32mm, straight. Plastic box, contents 500.','19','3','+00-00','102074','orderable','22','19','http://www.supp-102074.com/cat/hw/p2316.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2322','Screws <Z.28.P>','Screws: Zinc, size 28 mm, Phillips head. Carton box, contents 850.','19','2','+00-00','102076','orderable','23','18','http://www.supp-102076.com/cat/hw/p2322.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2323','Screws <B.32.P>','Screws: Brass, size 32mm, Phillips head. Plastic box, contents 400.','19','3','+00-00','102071','orderable','18','14','http://www.supp-102071.com/cat/hw/p2323.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2326','Plastic Stock - Y','Plastic Stock - Yellow, standard quality.','39','1','+00-00','103093','orderable','2','1','http://www.supp-103093.com/cat/off/p2326.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2330','Plastic Stock - R','Plastic Stock - Red, standard quality.','39','1','+00-00','103093','orderable','2','1','http://www.supp-103093.com/cat/off/p2330.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2337','Business Cards - 1000/2L','Business cards box, capacity 1000, 2-sided with different language on each side. Use form BC111-2, Rev. 12/1999 (hardcopy or online) when ordering - complete all fields marked with an asterisk and check box for second language (English is always on side 1).','32','1','+00-00','103091','orderable','300','246','http://www.supp-103091.com/cat/off/p2337.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2339','Paper - Std Printer','20 lb. 8.5x11 inch white laser printer paper (recycled), ten 500-sheet reams','32','3','+00-00','103095','orderable','25','21','http://www.supp-103095.com/cat/off/p2339.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2359','LCD Monitor 9/PM','Liquid Cristal Display 9 inch passive monitor. Enjoy the productivity that a small monitor can bring via more workspace on your desk. Easy setup with plug-and-play compatibility.','11','3','+00-03','102061','orderable','249','206','http://www.www.supp-102061.com/cat/hw/p2359.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2370','PS 220V /HS/FR','220V hot swappable power supply, for France.','19','2','+00-09','102053','orderable','91','75','http://www.supp-102053.com/cat/hw/p2370.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2373','Cable RS232 10/AF','10 ft RS232 cable with F/F and 9F/25F adapters','19','2','+01-00','102055','orderable','6','4','http://www.supp-102055.com/cat/hw/p2373.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2377','PS 110V HS/US','110 V hot swappable power supply - US compatible','19','2','+01-00','102062','orderable','97','82','http://www.supp-102062.com/cat/hw/p2377.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2380','Cable PR/15/P','15 foot parallel printer cable','19','2','+00-01','102055','orderable','6','5','http://www.supp-102055.com/cat/hw/p2380.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('2381','CD-ROM 8x','CD Writer, read only, speed 8x','17','1','+00-03','102052','obsolete','99','82','http://www.supp-102052.com/cat/hw/p2381.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3106','KB 101/EN','Standard PC/AT Enhanced Keyboard (101/102-Key). Input locale: English (US).','16','1','+01-00','102066','orderable','48','41','http://www.supp-102066.com/cat/hw/p3106.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3114','MB - S900/650+','PC motherboard, 900 Series; standard motherboard for all models 650 and up.','15','3','+00-00','102086','under development','101','88','http://www.supp-102086.com/cat/hw/p3114.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3123','PS 220V /D','Standard power supply, 220V, for desktop computers.','19','2','+01-00','102062','orderable','81','65','http://www.supp-102062.com/cat/hw/p3123.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3129','Sound Card STD','Sound Card - standard version, with MIDI interface, line in/out, low impedance microphone input.','15','1','+00-06','102090','orderable','46','39','http://www.supp-102090.com/cat/hw/p3129.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3139','Screws <S.16.S>','Screws: Steel, size 16 mm, straight. Carton box, contents 750.','19','2','+00-00','102071','orderable','21','17','http://www.supp-102071.com/cat/hw/p3139.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3143','Screws <B.28.S>','Screws: Brass, size 28mm, straight. Plastic box, contents 500.','19','2','+00-00','102071','orderable','16','13','http://www.supp-102071.com/cat/hw/p3143.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3150','Card Holder - 25','Card Holder; heavy plastic business card holder with embossed corporate logo. Holds about 25 of your business cards, depending on card thickness.','32','1','+00-06','103089','orderable','18','15','http://www.supp-103089.com/cat/off/p3150.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3163','Manual - Vision Net6.3/US','Vision Networking V6.3 Reference Manual. US version with advanced encryption.','33','2','+00-00','103083','orderable','35','29','http://www.supp-103083.com/cat/off/p3163.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3165','Manual - Vision Tools2.0','Vision Business Tools Suite V2.0 Reference Manual. Includes installation, configuration, and user guide.','33','2','+00-00','103083','orderable','40','34','http://www.supp-103083.com/cat/off/p3165.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3167','Manual - Vision OS/2.x','Vision Operating System V2.0/2.1/2/3 Reference Manual. Complete installation, configuration, management, and tuning information for Vision system administration. Note that this manual replaces the individual Version 2.0 and 2.1 manuals.','33','2','+00-00','103083','orderable','55','47','http://www.supp-103083.com/cat/off/p3167.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3170','Smart Suite - V/SP','Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for Vision. Spanish language software and user manuals.','29','2','+00-06','103089','orderable','161','132','http://www.supp-103089.com/cat/sw/p3170.html');
Insert into PRODUCT_INFORMATION (PRODUCT_ID,PRODUCT_NAME,PRODUCT_DESCRIPTION,CATEGORY_ID,WEIGHT_CLASS,WARRANTY_PERIOD,SUPPLIER_ID,PRODUCT_STATUS,LIST_PRICE,MIN_PRICE,CATALOG_URL) values ('3176','Smart Suite - V/EN','Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for Vision. English language software and user manuals.','29','2','+00-06','103089','orderable','120','103','http://www.supp-103089.com/cat/sw/p3176.html');


/*==============================================================*/
/* INSERT in REGIONS                                 */
/*==============================================================*/
Insert into REGIONS (REGION_ID,REGION_NAME) values ('1','Europe');
Insert into REGIONS (REGION_ID,REGION_NAME) values ('2','Americas');
Insert into REGIONS (REGION_ID,REGION_NAME) values ('3','Asia');
Insert into REGIONS (REGION_ID,REGION_NAME) values ('4','Middle East and Africa');

/*==============================================================*/
/* INSERT in CHANNELS                                   */
/*==============================================================*/
Insert into CHANNELS (CHANNEL_ID,CHANNEL_DESC,CHANNEL_CLASS,CHANNEL_CLASS_ID,CHANNEL_TOTAL,CHANNEL_TOTAL_ID) values ('3','Direct Sales','Direct','12','Channel total','1');
Insert into CHANNELS (CHANNEL_ID,CHANNEL_DESC,CHANNEL_CLASS,CHANNEL_CLASS_ID,CHANNEL_TOTAL,CHANNEL_TOTAL_ID) values ('9','Tele Sales','Direct','12','Channel total','1');
Insert into CHANNELS (CHANNEL_ID,CHANNEL_DESC,CHANNEL_CLASS,CHANNEL_CLASS_ID,CHANNEL_TOTAL,CHANNEL_TOTAL_ID) values ('5','Catalog','Indirect','13','Channel total','1');
Insert into CHANNELS (CHANNEL_ID,CHANNEL_DESC,CHANNEL_CLASS,CHANNEL_CLASS_ID,CHANNEL_TOTAL,CHANNEL_TOTAL_ID) values ('4','Internet','Indirect','13','Channel total','1');
Insert into CHANNELS (CHANNEL_ID,CHANNEL_DESC,CHANNEL_CLASS,CHANNEL_CLASS_ID,CHANNEL_TOTAL,CHANNEL_TOTAL_ID) values ('2','Partners','Others','14','Channel total','1');


/*==============================================================*/
/* INSERT in COUNTRIES                                   */
/*==============================================================*/
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AR','Argentina','2');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('AU','Australia','3');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('BE','Belgium','1');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('BR','Brazil','2');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CA','Canada','2');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CH','Switzerland','1');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('CN','China','3');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('DE','Germany','1');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('DK','Denmark','1');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('EG','Egypt','4');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('FR','France','1');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IL','Israel','4');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IN','India','3');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('IT','Italy','1');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('JP','Japan','3');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('KW','Kuwait','4');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ML','Malaysia','3');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('MX','Mexico','2');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('NG','Nigeria','4');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('NL','Netherlands','1');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('SG','Singapore','3');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('UK','United Kingdom','1');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('US','United States of America','2');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ZM','Zambia','4');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('ZW','Zimbabwe','4');
Insert into COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) values ('TH','Thailand','3');


/*==============================================================*/
/* INSERT in JOBS                                  */
/*==============================================================*/
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_PRES','President','20080','40000');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_VP','Administration Vice President','15000','30000');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_ASST','Administration Assistant','3000','6000');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('FI_MGR','Finance Manager','8200','16000');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('FI_ACCOUNT','Accountant','4200','9000');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AC_MGR','Accounting Manager','8200','16000');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AC_ACCOUNT','Public Accountant','4200','9000');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SA_MAN','Sales Manager','10000','20080');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SA_REP','Sales Representative','6000','12008');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PU_MAN','Purchasing Manager','8000','15000');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PU_CLERK','Purchasing Clerk','2500','5500');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('ST_MAN','Stock Manager','5500','8500');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('ST_CLERK','Stock Clerk','2008','5000');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SH_CLERK','Shipping Clerk','2500','5500');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('IT_PROG','Programmer','4000','10000');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('MK_MAN','Marketing Manager','9000','15000');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('MK_REP','Marketing Representative','4000','9000');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('HR_REP','Human Resources Representative','4000','9000');
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PR_REP','Public Relations Representative','4500','10500');


/*==============================================================*/
/* INSERT in LOCATIONS                                   */
/*==============================================================*/
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('3300','Sabah al-Ahmad al-Dschabir as-Sabah 1','555','Kuwait-City','Kuwait','KW');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1000','1297 Via Cola di Rie','00989','Roma',null,'IT');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1100','93091 Calle della Testa','10934','Venice',null,'IT');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1200','2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1300','9450 Kamiya-cho','6823','Hiroshima',null,'JP');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1400','2014 Jabberwocky Rd','26192','Southlake','Texas','US');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1500','2011 Interiors Blvd','99236','South San Francisco','California','US');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1600','2007 Zagora St','50090','South Brunswick','New Jersey','US');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1700','2004 Charade Rd','98199','Seattle','Washington','US');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1800','147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('1900','6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2000','40-5-12 Laogianggen','190518','Beijing',null,'CN');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2100','1298 Vileparle (E)','490231','Bombay','Maharashtra','IN');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2200','12-98 Victoria Street','2901','Sydney','New South Wales','AU');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2300','198 Clementi North','540198','Singapore',null,'SG');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2400','8204 Arthur St',null,'London',null,'UK');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2500','Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2600','9702 Chester Road','09629850293','Stretford','Manchester','UK');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2700','Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2800','Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('2900','20 Rue des Corps-Saints','1730','Geneva','Geneve','CH');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('3000','Murtenstrasse 921','3095','Bern','BE','CH');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('3100','Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values ('3200','Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');


/*==============================================================*/
/* INSERT in CUSTOMERS                                   */
/*==============================================================*/
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('81','Sales America','145','1800');
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('82','Sales Asia','145','2300');
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('83','Sales Africa Middle East','145','3300');
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('10','Administration','200','1700');
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('20','Marketing','201','1800');
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('30','Purchasing','114','1700');
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('40','Human Resources','203','2400');
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('50','Shipping','124','1500');
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('60','IT','103','1400');
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('70','Public Relations','204','2700');
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('80','Sales Europe','145','2500');
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('90','Executive',NULL,'1700');
Insert into DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) values ('100','Finance','108','1700');


/*==============================================================*/
/* INSERT in EMPLOYEES                                   */
/*==============================================================*/
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('200','Jennifer','Whalen','JWHALEN','515.123.4444',to_date('17.09.03','DD.MM.RR'),'AD_ASST','4400',null,'101','10');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('202','Pat','Fay','PFAY','603.123.6666',to_date('17.08.05','DD.MM.RR'),'MK_REP','6000',null,'201','20');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('201','Michael','Hartstein','MHARTSTE','515.123.5555',to_date('17.02.04','DD.MM.RR'),'MK_MAN','13000',null,'100','20');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('117','Sigal','Tobias','STOBIAS','515.127.4564',to_date('24.07.05','DD.MM.RR'),'PU_CLERK','2800',null,'114','30');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('203','Susan','Mavris','SMAVRIS','515.123.7777',to_date('07.06.02','DD.MM.RR'),'HR_REP','6500',null,'101','40');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('197','Kevin','Feeney','KFEENEY','650.507.9822',to_date('23.05.06','DD.MM.RR'),'SH_CLERK','3000',null,'124','50');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('199','Douglas','Grant','DGRANT','650.507.9844',to_date('13.01.08','DD.MM.RR'),'SH_CLERK','2600',null,'124','50');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('104','Bruce','Ernst','BERNST','590.423.4568',to_date('21.05.07','DD.MM.RR'),'IT_PROG','6000',null,'103','60');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('105','David','Austin','DAUSTIN','590.423.4569',to_date('25.06.05','DD.MM.RR'),'IT_PROG','4800',null,'103','60');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('204','Hermann','Baer','HBAER','515.123.8888',to_date('07.06.02','DD.MM.RR'),'PR_REP','10000',null,'101','70');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('145','John','Russell','JRUSSEL','011.44.1344.429268',to_date('01.10.04','DD.MM.RR'),'SA_MAN','14000','0,4','100','80');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('146','Karen','Partners','KPARTNER','011.44.1344.467268',to_date('05.01.05','DD.MM.RR'),'SA_MAN','13500','0,3','100','80');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('364','Tamiko','Church','ewrt0@example.com','045-543-6828',to_date('07.12.01','DD.MM.RR'),'SA_REP','10479',null,'146','81');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('368','Whitney','Chen','lxexb08@example.com','598-837-5465',to_date('20.05.00','DD.MM.RR'),'SA_REP','10683',null,'146','82');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('378','Ron','Bender','zopi.yvntqp@example.com','651-802-2951',to_date('04.07.06','DD.MM.RR'),'SA_REP','8922',null,'146','82');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('374','Tim','Andersen','zlcqn744@example.com','559-667-3283',to_date('02.05.08','DD.MM.RR'),'SA_REP','10252',null,'145','83');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('376','Darla','Wright','pgdl6@example.com','176-673-9318',to_date('05.03.06','DD.MM.RR'),'SA_REP','8599',null,'146','83');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('100','Steven','King','SKING','515.123.4567',to_date('17.06.03','DD.MM.RR'),'AD_PRES','24000',null,null,'90');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('102','Lex','De Haan','LDEHAAN','515.123.4569',to_date('13.01.01','DD.MM.RR'),'AD_VP','17000',null,'100','90');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('108','Nancy','Greenberg','NGREENBE','515.124.4569',to_date('17.08.02','DD.MM.RR'),'FI_MGR','12008',null,'101','100');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('101','Neena','Kochhar','NKOCHHAR','515.123.4568',to_date('21.09.05','DD.MM.RR'),'AD_VP','17000',null,'100','90');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('103','Alexander','Hunold','AHUNOLD','590.423.4567',to_date('03.01.06','DD.MM.RR'),'IT_PROG','9000',null,'102','60');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('114','Den','Raphaely','DRAPHEAL','515.127.4561',to_date('07.12.02','DD.MM.RR'),'PU_MAN','11000',null,'100','30');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('124','Kevin','Mourgos','KMOURGOS','650.123.5234',to_date('16.11.07','DD.MM.RR'),'ST_MAN','5800',null,'100','50');
Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID) values ('149','Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018',to_date('29.01.08','DD.MM.RR'),'SA_MAN','10500','0,2','100','80');



/*==============================================================*/
/* INSERT in JOB_HISTORY                                   */
/*==============================================================*/
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('102',to_date('13.01.01','DD.MM.RR'),to_date('24.07.06','DD.MM.RR'),'IT_PROG','60');
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('201',to_date('17.02.04','DD.MM.RR'),to_date('19.12.07','DD.MM.RR'),'MK_REP','20');
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('114',to_date('24.03.06','DD.MM.RR'),to_date('31.12.07','DD.MM.RR'),'ST_CLERK','50');
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('200',to_date('17.09.95','DD.MM.RR'),to_date('17.06.01','DD.MM.RR'),'AD_ASST','90');
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values ('200',to_date('01.07.02','DD.MM.RR'),to_date('31.12.06','DD.MM.RR'),'AC_ACCOUNT','90');



/*==============================================================*/
/* INSERT in CUSTOMERS                                   */
/*==============================================================*/
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('185','Matthew','Wright','33 Pine St 14094 Lockport NY','US','+1 716 123 4599','us','AMERICA','1200','Matthew.Wright@OVENBIRD.EXAMPLE.COM','149','1',to_date('01.12.59','DD.MM.RR'),'married','F','G: 130,000 - 149,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('186','Meena','Alexander','Po Box 2152 14240 Buffalo NY','US','+1 716 123 4605','us','AMERICA','1200','Meena.Alexander@PARULA.EXAMPLE.COM','149','1',to_date('11.12.61','DD.MM.RR'),'single','F','K: 250,000 - 299,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('187','Grace','Dvrrie','2979 Hamburg St 12303 Schenectady NY','AR','+1 518 123 4617','us','AMERICA','1200','Grace.Dvrrie@PHOEBE.EXAMPLE.COM','149','1',to_date('31.12.48','DD.MM.RR'),'married','F','E: 90,000 - 109,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('188','Charlotte','Buckley','1790 Grand Blvd 12309 Schenectady AR','DE','+1 518 123 4618','us','AMERICA','1200','Charlotte.Buckley@PINTAIL.EXAMPLE.COM','149','1',to_date('10.01.49','DD.MM.RR'),'single','F','F: 110,000 - 129,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('189','Gena','Harris-Miller','7 Ingelside Ln 10605 White Plains NY','DK','+1 914 123 4619','us','AMERICA','1200','Gena.Harris@PIPIT.EXAMPLE.COM','149','1',to_date('30.01.55','DD.MM.RR'),'married','M','F: 110,000 - 129,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('190','Gena','Curtis','18 Glenridge Rd 12302 Schenectady NY','DK','+1 518 123 4624','us','AMERICA','1200','Gena.Curtis@PLOVER.EXAMPLE.COM','149','1',to_date('09.02.82','DD.MM.RR'),'single','M','J: 190,000 - 249,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('191','Maureen','Sanders','6432 Rising Sun Ave 19111 Philadelphia PA','US','+1 215 123 4644','us','AMERICA','1200','Maureen.Sanders@PUFFIN.EXAMPLE.COM','149','1',to_date('29.02.24','DD.MM.RR'),'married','M','A: Below 30,000');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('192','Sean','Stockwell','Rr 10 19606 Reading PA','US','+1 610 123 4657','us','AMERICA','1200','Sean.Stockwell@PYRRHULOXIA.EXAMPLE.COM','149','1',to_date('30.03.56','DD.MM.RR'),'married','M','I: 170,000 - 189,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('193','Harry dean','Kinski','2455 Rose Garden Rd 15220 Pittsburgh PA','UK','+1 412 123 4662','us','AMERICA','1200','Harrydean.Kinski@REDPOLL.EXAMPLE.COM','149','1',to_date('30.04.55','DD.MM.RR'),'married','M','D: 70,000 - 89,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('194','Kathleen','Garcia','1812 Timberline Rd 16601 Altoona PA','UK','+1 814 123 4663','us','AMERICA','1200','Kathleen.Garcia@REDSTART.EXAMPLE.COM','149','1',to_date('30.05.71','DD.MM.RR'),'married','F','I: 170,000 - 189,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('195','Sean','Olin','141 Schiller St 19601 Reading PA','US','+1 610 123 4664','us','AMERICA','1200','Sean.Olin@SCAUP.EXAMPLE.COM','149','1',to_date('09.06.86','DD.MM.RR'),'single','F','F: 110,000 - 129,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('196','Gerard','Dench','1126 Pawlings Rd 19403 Norristown PA','US','+1 610 123 4667','us','AMERICA','1200','Gerard.Dench@SCOTER.EXAMPLE.COM','149','1',to_date('29.06.53','DD.MM.RR'),'married','F','E: 90,000 - 109,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('197','Gerard','Altman','55 Church Hill Rd 19606 Reading PA','ZW','+1 610 123 4669','us','AMERICA','1200','Gerard.Altman@SHRIKE.EXAMPLE.COM','149','1',to_date('08.07.84','DD.MM.RR'),'single','F','F: 110,000 - 129,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('198','Maureen','de Funes','354 N Prince St 17603 Lancaster PA','ZW','+1 717 123 4674','us','AMERICA','1200','Maureen.deFunes@SISKIN.EXAMPLE.COM','149','1',to_date('29.07.49','DD.MM.RR'),'married','F','D: 70,000 - 89,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('199','Clint','Chapman','115 Chestnut St 19106 Philadelphia PA','NG','+1 215 123 4676','us','AMERICA','1400','Clint.Chapman@SNIPE.EXAMPLE.COM','149','1',to_date('07.08.52','DD.MM.RR'),'single','F','F: 110,000 - 129,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('200','Clint','Gielgud','2899 Grand Ave 15225 Pittsburgh PA','TH','+1 412 123 4681','us','AMERICA','1400','Clint.Gielgud@STILT.EXAMPLE.COM','149','1',to_date('28.08.78','DD.MM.RR'),'married','F','E: 90,000 - 109,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('201','Eric','Prashant','Po Box 39 15701 Indiana PA','US','+1 412 123 4684','us','AMERICA','1400','Eric.Prashant@TATTLER.EXAMPLE.COM','149','1',to_date('27.09.43','DD.MM.RR'),'married','F','C: 50,000 - 69,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('202','Ingrid','Welles','1604 Broadway Ave 15216 Pittsburgh PA','TH','+1 412 123 4688','us','AMERICA','1400','Ingrid.Welles@TEAL.EXAMPLE.COM','149','1',to_date('27.10.39','DD.MM.RR'),'married','M','D: 70,000 - 89,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('203','Ingrid','Rampling','4734 Liberty Ave 15224 Pittsburgh PA','US','+1 412 123 4691','us','AMERICA','1400','Ingrid.Rampling@WIGEON.EXAMPLE.COM','149','1',to_date('05.11.48','DD.MM.RR'),'single','M','F: 110,000 - 129,999');
Insert into CUSTOMERS (CUSTOMER_ID,CUST_FIRST_NAME,CUST_LAST_NAME,CUST_ADDRESS,COUNTRY_ID,PHONE_NUMBER,NLS_LANGUAGE,NLS_TERRITORY,CREDIT_LIMIT,CUST_EMAIL,ACCOUNT_MGR_ID,CUST_GEO_LOCATION,DATE_OF_BIRTH,MARITAL_STATUS,GENDER,INCOME_LEVEL) values ('204','Cliff','Puri','21 Thornwood Rd 17112 Harrisburg PA','DE','+1 717 123 4692','us','AMERICA','1400','Cliff.Puri@CORMORANT.EXAMPLE.COM','149','1',to_date('26.11.61','DD.MM.RR'),'married','M','J: 190,000 - 249,999');




/*==============================================================*/
/* INSERT in ORDERS                                  */
/*==============================================================*/
Insert into ORDERS (ORDER_ID,ORDER_DATE,CHANNEL_ID,CUSTOMER_ID,ORDER_STATUS,ORDER_TOTAL,SALES_REP_ID,PROMOTION_ID) values ('2354',to_timestamp('14.07.08 17:18:23,234567000','DD.MM.RR HH24:MI:SSXFF'),2,'185','10','46257','145',null);
Insert into ORDERS (ORDER_ID,ORDER_DATE,CHANNEL_ID,CUSTOMER_ID,ORDER_STATUS,ORDER_TOTAL,SALES_REP_ID,PROMOTION_ID) values ('2355',to_timestamp('26.01.07 09:22:51,962632000','DD.MM.RR HH24:MI:SSXFF'),3,'186','10','94513,5',null,null);
Insert into ORDERS (ORDER_ID,ORDER_DATE,CHANNEL_ID,CUSTOMER_ID,ORDER_STATUS,ORDER_TOTAL,SALES_REP_ID,PROMOTION_ID) values ('2356',to_timestamp('26.01.08 09:22:41,934562000','DD.MM.RR HH24:MI:SSXFF'),4,'188','10','29473,8',376,null);
Insert into ORDERS (ORDER_ID,ORDER_DATE,CHANNEL_ID,CUSTOMER_ID,ORDER_STATUS,ORDER_TOTAL,SALES_REP_ID,PROMOTION_ID) values ('2357',to_timestamp('08.01.07 20:19:44,123456000','DD.MM.RR HH24:MI:SSXFF'),5,'190','9','59872,4','374',null);
Insert into ORDERS (ORDER_ID,ORDER_DATE,CHANNEL_ID,CUSTOMER_ID,ORDER_STATUS,ORDER_TOTAL,SALES_REP_ID,PROMOTION_ID) values ('2358',to_timestamp('08.01.06 17:03:12,654278000','DD.MM.RR HH24:MI:SSXFF'),5,'192','10','7826','364',null);
Insert into ORDERS (ORDER_ID,ORDER_DATE,CHANNEL_ID,CUSTOMER_ID,ORDER_STATUS,ORDER_TOTAL,SALES_REP_ID,PROMOTION_ID) values ('2359',to_timestamp('08.01.07 21:34:13,112233000','DD.MM.RR HH24:MI:SSXFF'),2,'194','9','5543,1','376',null);
Insert into ORDERS (ORDER_ID,ORDER_DATE,CHANNEL_ID,CUSTOMER_ID,ORDER_STATUS,ORDER_TOTAL,SALES_REP_ID,PROMOTION_ID) values ('2360',to_timestamp('14.11.06 12:22:31,223344000','DD.MM.RR HH24:MI:SSXFF'),3,'196','10','990,4','378',null);
Insert into ORDERS (ORDER_ID,ORDER_DATE,CHANNEL_ID,CUSTOMER_ID,ORDER_STATUS,ORDER_TOTAL,SALES_REP_ID,PROMOTION_ID) values ('2361',to_timestamp('04.03.07 18:15:00,223344000','DD.MM.RR HH24:MI:SSXFF'),4,'196','10','990,4','378',null);




/*==============================================================*/
/* INSERT in ORDER_ITEMS                                  */
/*==============================================================*/
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2354','5','3139','21','48');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2354','10','3167','51','68');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2354','11','3170','145,2','70');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2354','4','3129','41','47');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2354','3','3123','79','47');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2354','8','3163','30','61');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2354','12','3176','113,3','72');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2354','2','3114','96,8','43');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2354','1','3106','48','61');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2354','9','3165','37','64');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2354','6','3143','16','53');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2354','13','3182','61','77');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2354','7','3150','17','58');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2355','7','2330','1,1','197');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2355','6','2326','1,1','192');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2355','5','2323','17','190');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2355','4','2322','19','188');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2355','3','2311','86,9','188');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2355','2','2308','57','185');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2355','1','2289','46','200');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2355','9','2359','226,6','204');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2355','8','2339','25','199');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2356','1','2264','199,1','38');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2356','6','2311','95','51');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2356','4','2299','72','44');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2356','7','2316','22','55');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2356','3','2293','98','40');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2356','5','2308','58','47');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2356','2','2274','148,5','34');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2356','8','2323','18','55');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2357','8','2289','48','41');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2357','7','2276','236,5','38');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2357','4','2257','371,8','29');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2357','5','2262','95','29');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2357','6','2268','75','32');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2357','2','2245','462','26');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2357','3','2252','788,7','26');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2357','1','2211','3,3','140');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2358','3','1797','316,8','12');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2358','5','1808','55','14');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2358','4','1803','55','13');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2358','2','1782','125','4');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2358','1','1781','226,6','9');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2359','4','2373','6','17');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2359','6','2380','5,5','17');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2359','2','2359','249','1');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2359','7','2381','97','17');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2359','5','2377','96','17');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2359','3','2370','91','17');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2359','1','2337','270,6','1');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2360','2','2093','7,7','42');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2360','1','2058','23','29');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2361','2','2093','7,7','42');
Insert into ORDER_ITEMS (ORDER_ID,LINE_ITEM_ID,PRODUCT_ID,UNIT_PRICE,QUANTITY) values ('2361','1','2058','23','29');

COMMIT;
prompt fertig
set feedback on
set define on
