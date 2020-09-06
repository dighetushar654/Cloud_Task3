provider "kubernetes" {
config_context_cluster = "minikube"
}

resource "kubernetes_deployment" "wordpressdeployment" {
 metadata {
  name = "wordpress"
 }
 
 spec {
  replicas = 3
  selector {
   match_labels = {
    env = "development"
    app = "wordpress"
   }
            
  }
  
  template {
   metadata {
    labels = {
     env = "development"
     app = "wordpress"
    }
   }


   spec {
    container {
     image = "wordpress:latest"
     name = "myfirstsite"
    }
   }
  }
 }
}


resource "kubernetes_service" "wordpressdata" {
	depends_on = [kubernetes_deployment.wordpressdeployment]


 	metadata {
  		name = "wordpressdata"
 	}


 	spec {
  		selector = {
   		app = "wordpress"
  	}
  
  port {
   protocol = "TCP"
   port = 80
   target_port = 80
  }
  
  type = "NodePort"
 }
}