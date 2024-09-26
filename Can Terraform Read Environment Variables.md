<h1>How to Use Environment Variables with Terraform</h1>
<p>Terraform is a powerful infrastructure as code tool that allows you to define, provision, and manage infrastructure in a safe, consistent, and repeatable way. But how do you handle sensitive data like passwords and API keys? That's where environment variables come in handy!</p>
<h2>What are Environment Variables?</h2>
<p>Environment variables are dynamic values that exist outside of your Terraform code. They can be set at runtime rather than being hardcoded. </p>
<p>Some common uses for environment variables:</p>
<ul>
<li>API keys </li>
<li>Database passwords</li>
<li>Secret keys</li>
<li>Resource IDs</li>
<li>Anything else that needs to be kept secure</li>
</ul>
<h2>Accessing Environment Variables in Terraform</h2>
<p>Terraform provides the <code>getenv()</code> function to read environment variable values. For example:</p>
<p><code>hcl
resource "aws_db_instance" "default" {
  password = getenv("DB_PASSWORD")
}</code></p>
<p>This reads the <code>DB_PASSWORD</code> environment variable rather than hardcoding the password in your Terraform code.</p>
<p>You can set environment variables in your shell before running Terraform:</p>
<p><code>bash
export DB_PASSWORD=supersecurepassword 
terraform apply</code></p>
<h2>Best Practices</h2>
<ul>
<li>Store sensitive values in environment variables only</li>
<li>Commit your Terraform code without credentials checked in </li>
<li>Set environment variables on your workstation or in your CI/CD pipeline</li>
<li>Never hardcode sensitive data in your configuration files</li>
</ul>
<h2>Reusability with Variable Definitions</h2>
<p>For better reusability, you can define variables in your Terraform code that reference your environment variables:</p>
<p>```hcl
variable "db_password" {}</p>
<p>resource "aws_db_instance" "default" {
  password = var.db_password 
}
```</p>
<p>Then pass the environment variable as a value:</p>
<p><code>bash
export DB_PASSWORD=supersecurepassword
terraform apply -var='db_password=${DB_PASSWORD}'</code></p>
<p>This keeps your Terraform code cleaner and more reusable.</p>
<h2>Conclusion</h2>
<p>Using environment variables allows you to keep sensitive data separate from your main Terraform code. This improves security, reusability, and collaboration. Just be sure not to commit credentials to your version control system!</p>
<p>With <code>getenv()</code> and variable definitions, accessing environment variables in Terraform is easy. Give it a try on your next infrastructure project!</p>