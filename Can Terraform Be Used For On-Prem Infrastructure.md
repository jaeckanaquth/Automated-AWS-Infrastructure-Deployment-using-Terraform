<p>How Can Terraform Be Used For On-Prem Infrastructure?</p>
<p>Infrastructure as code (IaC) is becoming increasingly popular for managing IT infrastructure. Terraform is one of the most widely used IaC tools, but many are wondering if it can also be used for on-premises infrastructure. In this post, we'll explore how Terraform can help manage your on-prem environment.</p>
<p>What is Terraform?</p>
<p>Terraform is an open-source IaC tool created by HashiCorp. It allows you to define infrastructure in configuration files that can be shared and version controlled. Terraform can manage infrastructure across public cloud providers as well as on-premises solutions. </p>
<p>Some key benefits of Terraform include:</p>
<ul>
<li>
<p>Infrastructure as Code - Infrastructure is defined in declarative configuration files rather than through manual processes. This makes it easy to version, replicate, and share.</p>
</li>
<li>
<p>Execution Plans - Terraform creates an execution plan showing what it will do before making any infrastructure changes. This allows you to preview changes before applying them.</p>
</li>
<li>
<p>Resource Graph - Terraform builds a resource graph to understand dependencies. It uses this to create resources in the correct order and parallelize as much as possible.</p>
</li>
<li>
<p>Change Automation - Complex change sets can be applied to infrastructure automatically and predictably.</p>
</li>
</ul>
<p>Using Terraform for On-Prem Infrastructure</p>
<p>Many assume Terraform is only suited for public cloud infrastructure, but it can manage on-prem solutions as well. Here are some examples:</p>
<h3>VMware</h3>
<p>Terraform can provision and manage VMware infrastructure like vSphere clusters, virtual machines, and networks. The VMware vSphere provider allows full lifecycle management.</p>
<p>```</p>
<h1>Configure VMware provider</h1>
<p>provider "vsphere" {
  vsphere_server = "${var.vsphere_server}"
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
}</p>
<h1>Create a VMware VM</h1>
<p>resource "vsphere_virtual_machine" "vm" {
  ...
}
```</p>
<h3>Networking</h3>
<p>Terraform integrates with on-prem networking gear like Cisco ACI, Arista, and Juniper. It can automate configuration of physical switches, routers, and other appliances.</p>
<p>```</p>
<h1>Configure Cisco ACI provider</h1>
<p>provider "aci" {
  username = "${var.aci_username}"
  password = "${var.aci_password}"
  url      = "https://${var.aci_apic_hostname}"
}</p>
<h1>Create a Cisco ACI network</h1>
<p>resource "aci_rest_managed" "net" {
  dn         = "uni/tn-${aci_tenant}/BD-${aci_bridge_domain}"
  class_name = "fvBD"
}
```</p>
<h3>Kubernetes</h3>
<p>Terraform can deploy and manage on-prem Kubernetes clusters like OpenShift, Rancher, Pivotal Container Service (PKS), etc. It's a simple way to automate cluster creation and configuration.</p>
<p>```</p>
<h1>Deploy a Kubernetes cluster</h1>
<p>module "cluster" {
  source       = "app.terraform.io/example/kubernetes"
  cluster_name = "onprem-k8s"
  location     = "onprem"
}
```</p>
<p>Conclusion</p>
<p>While often associated with the public cloud, Terraform is infrastructure agnostic and can help manage both cloud and on-prem environments. It allows you to automate manual processes, implement governance, and enable collaboration across teams. With the right providers, Terraform makes it easy to codify your on-prem infrastructure just like in the cloud.</p>