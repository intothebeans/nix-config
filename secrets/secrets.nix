let
  admin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIsHgZlt7xX7af0RXhTRlP8oqZUuyP70g8q/A7oHDLxM";
  beans = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOlBs5J+/fm3x4xOClnOMLmOqoz5Qz/SCS6fF/ggzJP2";
  users = [
    admin
    beans
  ];

  server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHzrNReouK8qmrBiCFccq/MKG0XtO6KT73Sf5KsCnRr2";
  laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ3HZT7DwMLo8BtGmHlEtwMIduh/++x0sCDRjOrEm6kC";
  systems = [
    server
    laptop
  ];
in
{
  "wifi.age".publicKeys = [
    admin
    server
  ];
  "postfix.age".publicKeys = [admin server];
}
