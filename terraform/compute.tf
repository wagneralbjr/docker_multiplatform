data "oci_core_images" "ampere-ubuntu-images" {
  compartment_id           = var.compartiment_id
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "20.04"
  shape                    = "VM.Standard.A1.Flex"
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}


data  "template_file" "user_data"{
    template = file("./userdata.yaml")
}



resource "oci_core_instance" "python-hello" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.compartiment_id
    shape = "VM.Standard.A1.Flex"
    shape_config {
        memory_in_gbs = "24"
        ocpus = "4"
    }
    source_details {
        #source_id = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaafkbto4tg6kfbdyi6zvf43di3x4gdei7zeb2n4imi5k5eckegozkq"
        source_id = data.oci_core_images.ampere-ubuntu-images.images[0].id
        source_type = "image"
        boot_volume_size_in_gbs = "200"
    }
    
    # Optional
    display_name = "python_hello"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = "ocid1.subnet.oc1.sa-saopaulo-1.aaaaaaaaeaa7fm5f6qipjf4f3arfrc5ekntbqqfx33kdges2uuslq6i6hg3a"
    }
    #user_data = data.template_file.user_data.rendered
    metadata = {
       
        user_data = filebase64("userdata.yaml"),
        #ssh_authorized_keys = file("/home/wagner/.ssh/id_rsa.pub"),
    
    } 
    preserve_boot_volume = false
}
