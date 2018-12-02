node 'node1' {
    notify {"****** NODE1 BLOCK ******":}
    
    class{'::tomcat':
        user    =>  'root',
        group   => 'root',
        service_state   =>   'running',
    
    
    }
    include base
    
    tomcat::deploy{"sysfoo":
        deploy_url      =>  "https://3-159680031-gh.circle-artifacts.com/0/tmp/circle-artifacts.eV5f3Hz/sysfoo.war",
        checksum        =>  'md5',
        checksum_value  =>  '9ded0cd7059454f480ec9eaefbc9f7a3'
    }
    
    
}



node 'node2' {
    notify {"****** NODE2 BLOCK ******":}
    class{'::tomcat':
        user    =>  'devops',
        group   => 'devops',
        service_state   =>   'running',
    
    }
    include base
    
    tomcat::deploy{"sysfoo":
        deploy_url      =>  "https://3-159680031-gh.circle-artifacts.com/0/tmp/circle-artifacts.eV5f3Hz/sysfoo.war",
        checksum        =>  'md5',
        checksum_value  =>  '9ded0cd7059454f480ec9eaefbc9f7a3'
    
    }
}

node default {

    notify{'checkpoint_1':
        message => "**** DEFAULT BLOCK ****"
    }
    
}