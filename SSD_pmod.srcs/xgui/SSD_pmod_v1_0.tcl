# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_static_text $IPINST -name "TOP_GPIO_ENABLED" -parent ${Page_0} -text {}
  #Adding Group
  ipgui::add_group $IPINST -name "test" -parent ${Page_0}



}


