delimiter $$

CREATE DEFINER=`root`@`%` PROCEDURE `load_hethi_artist_task_list`(
in business_artist bigint)
BEGIN
Select
  hethi.ciconnector_efs.*,
  hethi.cbpaas_service_offering.BPaaS_service,
  hethi.uicbpaas_service_offering.BpaaS_service_image_id,
  hethi.uicbpaas_service_offering.BpaaS_service_description_short,
  hethi.uicbpaas_service_offering.BpaaS_service_description_long,
  hethi.uicbpaas_service_offering.BpaaS_service_status,
  hethi.cindustry_offering.indus_service,
  hethi.uicindustry_offering.industry_decription_short,
  hethi.uicindustry_offering.industry_decription_long,
  hethi.uicindustry_offering.industry_image_id,
  hethi.uicindustry_offering.industry_status,
  hethi.cform_lob.form_bclass,
  hethi.cform_lob.form_bsource,
  hethi.cform_lob.form_type,
  hethi.cform_lob.form_stencid,
  hethi.uicflob.form_type_decription_short,
  hethi.uicflob.form_type_decription_long,
  hethi.uicflob.form_type_image_id,
  hethi.uicflob.form_type_status,
  hethi.dcustomer.customer_name,
  hethi.dupload_file.upload_id,
  hethi.dupload_file.file_id,
  hethi.dupload_file.file_location,
  hethi.dcustomer_upload.*
From
   ciconnector_efs Inner Join
  cbpaas_service_offering On ciconnector_efs.BpaaS_id =
    cbpaas_service_offering.BpaaS_id Inner Join
  uicbpaas_service_offering On cbpaas_service_offering.BpaaS_id =
    uicbpaas_service_offering.BpaaS_id Inner Join
  cindustry_offering On ciconnector_efs.indus_id = cindustry_offering.indus_id
  Inner Join
  uicindustry_offering On cindustry_offering.indus_id =
    uicindustry_offering.indus_id Inner Join
  cform_lob On ciconnector_efs.efslob_id = cform_lob.efslob_id Inner Join
  uicflob On cform_lob.efslob_id = uicflob.efslob_id Inner Join
  dupload_file On ciconnector_efs.efs_uin = dupload_file.efs_uin Inner Join
  dcustomer_upload On dupload_file.upload_id = dcustomer_upload.upload_id
  Inner Join
  dcustomer On dcustomer.customer_id = dcustomer_upload.customer_id Inner Join
  dupload_status On dcustomer_upload.upload_id = dupload_status.upload_id
Where
 hethi.uicbpaas_service_offering.BpaaS_service_status = 1
 and hethi.dcustomer_upload.business_artist=business_artist and 
hethi.dupload_status.status=2 group by hethi.dupload_file.upload_id ;
END$$



delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `load_customer_list`()
BEGIN
Select 
dcustomer.customer_id,dupload_file.*,
cbpaas_service_offering.BPaaS_service,
cindustry_offering.indus_service,
dcustomer.customer_name,
cform_lob.form_type,dupload_file.file_location,
dupload_file.efs_uin, 
dupload_file.file_status,
cbpaas_service_offering.BpaaS_id,
cindustry_offering.indus_id,
cform_lob.form_stencid,cform_lob.efslob_id 
From dupload_file Inner Join ciconnector_efs 
On dupload_file.efs_uin = ciconnector_efs.efs_uin 
Inner Join cbpaas_service_offering On 
ciconnector_efs.BpaaS_id = cbpaas_service_offering.BpaaS_id 
Inner Join cindustry_offering On 
ciconnector_efs.indus_id = cindustry_offering.indus_id 
Inner Join cform_lob On 
ciconnector_efs.efslob_id = cform_lob.efslob_id 
Inner Join dcustomer_upload On 
dupload_file.upload_id = dcustomer_upload.upload_id 
Inner Join dcustomer On 
dcustomer.customer_id = dcustomer_upload.customer_id 
Where dcustomer_upload.business_artist Is Null  group by dupload_file.upload_id;
END$$



