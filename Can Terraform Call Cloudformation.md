<h1>Terraform and CloudFormation: Best Friends or Frenemies?</h1>
<p>Terraform and CloudFormation are two of the most popular infrastructure as code (IaC) tools. But how do they work together? In this post, we'll explore whether Terraform and CloudFormation are best friends who play nicely together, or frenemies who don't mix well.</p>
<h2>What is Terraform?</h2>
<p>Terraform is an open source IaC tool created by HashiCorp. It allows you to define infrastructure in configuration files using a declarative language called HCL (HashiCorp Configuration Language). Terraform can manage infrastructure on multiple cloud providers as well as on-prem solutions. </p>
<p>Some key features of Terraform include:</p>
<ul>
<li>Infrastructure as code - Infrastructure is defined in human-readable configuration files that can be tracked in version control.</li>
<li>Execution plans - Terraform shows you an execution plan before applying changes, so you can preview infrastructure changes before deploying. </li>
<li>Resource graph - Terraform builds a resource dependency graph to orchestrate the order of resource creation.</li>
<li>State management - Terraform maintains state to track resource changes.</li>
</ul>
<h2>What is CloudFormation?</h2>
<p>CloudFormation is Amazon Web Services' (AWS) proprietary IaC tool. It allows you to define AWS infrastructure in JSON or YAML template files. </p>
<p>Key features of CloudFormation:</p>
<ul>
<li>Infrastructure as code - Like Terraform, infrastructure is defined in template files that can be version controlled.</li>
<li>Deploy stacks - CloudFormation templates are deployed as stacks. You can create, update, or delete an entire stack.</li>
<li>Native AWS support - CloudFormation only works with AWS resources. </li>
</ul>
<h2>Can Terraform call CloudFormation?</h2>
<p>Yes! Terraform can invoke CloudFormation stacks using the <code>aws_cloudformation_stack</code> resource. </p>
<p>For example:</p>
<p>```
resource "aws_cloudformation_stack" "example" {
  name = "example-stack"</p>
<p>template_body = &lt;&lt;STACK
{
  "Resources" : {
    "ExampleResource" : {
      "Type" : "AWS::S3::Bucket",
      "Properties" : {
        "BucketName" : "example-bucket"
      }
    }
  }
}
STACK
}
```</p>
<p>This deploys a CloudFormation stack containing an S3 bucket resource.</p>
<p>You can also reference existing CloudFormation stacks by name or ARN.</p>
<h2>Pros and Cons of Using Both</h2>
<p>Some pros of using both tools together:</p>
<ul>
<li>Best of both worlds - Use Terraform for multi-cloud and CloudFormation for AWS-native resources.</li>
<li>Gradual migration - Slowly migrate resources from CloudFormation to Terraform over time.</li>
<li>Reuse existing stacks - Reference and integrate with your existing CloudFormation stacks.</li>
</ul>
<p>Some potential cons:</p>
<ul>
<li>Added complexity - Integrating both tools means added learning curve and complexity.</li>
<li>Duplication of efforts - IaC definitions are duplicated across Terraform and CloudFormation.</li>
<li>Troubleshooting difficulties - Harder to troubleshoot issues spanning both.</li>
</ul>
<h2>Conclusion</h2>
<p>Terraform and CloudFormation can work together, allowing you to leverage both tools. Use Terraform for multi-cloud infrastructure and CloudFormation for AWS-native resources. Be aware of added complexity from using two IaC tools. Overall, Terraform and CloudFormation are more best friends than enemies when used judiciously together!</p>