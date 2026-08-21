conf t
snmp-server group GLPI v3 priv
snmp-server user glpi GLPI v3 auth sha QvnGLPiPass4072 priv aes 128 QvnGLPiPass4072
snmp-server host 10.10.10.5 version 3 priv glpi
end