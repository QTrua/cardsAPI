node {
  stage('Checkout Tests') {
    checkout([$class: 'GitSCM',
            branches: [[name: '*/master']], 
            doGenerateSubmoduleConfigurations: false, 
            extensions: [],
            submoduleCfg: [],
            userRemoteConfigs: [[url: 'https://github.com/QTrua/cardsAPI.git']]])
  }

  stage('Execute Tests') {
    sh '/opt/SoapUI-5.4.0/bin/testrunner.sh -s"TestSuite 1" -r -a -j -J -f"./reports" "SP-REST-Project-2-soapui-project.xml"'
  }

  stage('Archive Tests') {
    junit keepLongStdio: true, testResults: 'reports/*.xml'
  }

  stage('Cleanup Workspace') {
    cleanWs deleteDirs: true
  }
}