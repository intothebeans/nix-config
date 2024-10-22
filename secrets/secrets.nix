let
  admin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIsHgZlt7xX7af0RXhTRlP8oqZUuyP70g8q/A7oHDLxM";
  server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHzrNReouK8qmrBiCFccq/MKG0XtO6KT73Sf5KsCnRr2";
in
{
  "wifi.age".publicKeys = [
    admin
    server
  ];
  "postfix.age".publicKeys = [
    admin
    server
  ];
  "email.age".publicKeys = [
    admin
    server
  ];
}
