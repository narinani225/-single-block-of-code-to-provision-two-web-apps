

output "webplanameid" {
  value = module.aspplaneinfo.aspplanid

}
output "webplanname" {

  value = module.aspplaneinfo.aspplanname
}


output "webappname" {
    value = (module.webserviceeinfo.webappname)
    sensitive = true
  
}