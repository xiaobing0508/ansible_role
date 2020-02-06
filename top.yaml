  
- hosts: all
  roles:
    - role: bash
- hosts: rsync
  roles:
    - role: rsync
- hosts: nfs
  roles:
    - role: nfs
    - role: lsyncd
- hosts: 172.16.1.51
  roles:
    - role: redis
- hosts: web
  roles:
    - role: cloud_web
    - role: wecenter_web
- hosts: lb
  roles:
    - role: cloud_lb
    - role: wecenter_lb
