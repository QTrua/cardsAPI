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

  stage('Publish JUnit Tests') {
    junit keepLongStdio: true, testResults: 'reports/*.xml'
  }

stage('Email results') {
    emailext (
      attachLog: true,
      subject: "JENKINS - Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
      body: '''
      Job '${JOB_NAME} [${BUILD_NUMBER}]': Check console output at '${BUILD_URL}' [${BUILD_NUMBER}]

TESTS:
Total = ${TEST_COUNTS}
Failed = ${TEST_COUNTS,var="fail"}
Passed = ${TEST_COUNTS,var="pass"}

JOB LOG:
${BUILD_LOG}''',
      to: "kenan@dkenan.com"
    )
  }

  stage('Cleanup Workspace') {
    cleanWs deleteDirs: true
  }
}
