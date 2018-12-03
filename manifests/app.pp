node 'node3' {
    notify {"****** NODE3 BLOCK ******":}
    class{'::tomcat':
        user    =>  'devops',
        group   => 'devops',
        service_state   =>   'running',
    
    }
    include base
    
    tomcat::deploy{"sysfoo":
        deploy_url      =>  "https://3-159680031-gh.circle-artifacts.com/0/tmp/circle-artifacts.eV5f3Hz/sysfoo.war",
    
    }
}

node default {

    notify{'checkpoint_1':
        message => "**** DEFAULT BLOCK ****"
    }
    
}
