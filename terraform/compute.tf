resource "oci_core_instance" "python-hello" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = "ocid1.compartment.oc1..aaaaaaaahzlbwdk6ufx5ef4zcvndpvz2knqw3d7fn5kxhtewaxvgbclfmhra"
    shape = "VM.Standard2.1"
    source_details {
        source_id = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaafkbto4tg6kfbdyi6zvf43di3x4gdei7zeb2n4imi5k5eckegozkq"
        source_type = "image"
    }

    # Optional
    display_name = "python_hello"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = "ocid1.subnet.oc1.sa-saopaulo-1.aaaaaaaaeaa7fm5f6qipjf4f3arfrc5ekntbqqfx33kdges2uuslq6i6hg3a"
    }
    metadata = {
        ssh_authorized_keys = file("/home/wagner/.ssh/id_rsa.pub")
    } 
    preserve_boot_volume = false
}
