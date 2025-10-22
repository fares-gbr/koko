# Educational demonstration script - Fullscreen Message Display
# For security awareness training and testing purposes only

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = ""
$form.Size = New-Object System.Drawing.Size(800, 600)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "None"
$form.BackColor = [System.Drawing.Color]::Black
$form.TopMost = $true

# Create the label with large bold text
$label = New-Object System.Windows.Forms.Label
$label.Text = "You Have Been Hacked!"
$label.Dock = "Fill"
$label.Font = New-Object System.Drawing.Font("Arial", 60, [System.Drawing.FontStyle]::Bold)
$label.ForeColor = [System.Drawing.Color]::Red
$label.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$label.AutoSize = $false

# Add click event to close on click
$form.Add_Click({ $form.Close() })
$label.Add_Click({ $form.Close() })

# Add ESC key to close
$form.Add_KeyDown({
    if ($_.KeyCode -eq "Escape") {
        $form.Close()
    }
})

# Add controls to form
$form.Controls.Add($label)

# Show the form
[void]$form.ShowDialog()