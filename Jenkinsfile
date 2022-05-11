pipeline {
    agent any

    stages 
    {
        stage('Event') 
        {
            steps 
            {
                echo 'Event Occurs from source'
            }
        }
        stage('Bulid') 
        {
            steps 
            {
                echo 'Source build      - Start ECU Simulation'
                bat 'D:\\Jenkins\\workspace\\CICT_AutomationDiVaPipeline_Home\\CI_DiVa\\vFlashCIAutomation\\PipelineBatchfiles\\ExecuteFlashing_CANFD_step1-1.bat'
                
                echo 'Software update   - flashing by vFlash '
                bat 'D:\\Jenkins\\workspace\\CICT_AutomationDiVaPipeline_Home\\CI_DiVa\\vFlashCIAutomation\\PipelineBatchfiles\\ExecuteFlashing_CANFD_step1-2.bat'
            }
        }
        stage('Test Setup') 
        {
            steps 
            {
                echo 'Step1 : Generate(Reload) Diag Test Case by DiVa'
                bat 'D:\\Jenkins\\workspace\\CICT_AutomationDiVaPipeline_Home\\CI_DiVa\\PipelineBatchfiles\\2-1.Automation_Diva_jenkins_step1-1.bat'
                echo 'Step2 : Generate test unit module from DiVa project'
                bat 'D:\\Jenkins\\workspace\\CICT_AutomationDiVaPipeline_Home\\CI_DiVa\\PipelineBatchfiles\\2-1.Automation_Diva_jenkins_step1-2.bat'
                echo 'Step3 : Open CANoe'
                bat 'D:\\Jenkins\\workspace\\CICT_AutomationDiVaPipeline_Home\\CI_DiVa\\PipelineBatchfiles\\2-1.Automation_Diva_jenkins_step1-3.bat'
                echo 'Step4 : Import DiVa project in CANoe'
                bat 'D:\\Jenkins\\workspace\\CICT_AutomationDiVaPipeline_Home\\CI_DiVa\\PipelineBatchfiles\\2-1.Automation_Diva_jenkins_step1-4.bat'
            }
        }
        stage('Testing') 
        {
            steps 
            {
                echo 'Step5 : Generate(Reload) Diag Test Case by DiVa'
                bat 'D:\\Jenkins\\workspace\\CICT_AutomationDiVaPipeline_Home\\CI_DiVa\\PipelineBatchfiles\\2-1.Automation_Diva_jenkins_step2-1.bat'
                echo 'Step6 : Generate test unit module from DiVa project'
                bat 'D:\\Jenkins\\workspace\\CICT_AutomationDiVaPipeline_Home\\CI_DiVa\\PipelineBatchfiles\\2-1.Automation_Diva_jenkins_step2-2.bat'
                echo 'Step7 : Open CANoe'
                bat 'D:\\Jenkins\\workspace\\CICT_AutomationDiVaPipeline_Home\\CI_DiVa\\PipelineBatchfiles\\2-1.Automation_Diva_jenkins_step2-3.bat'
                echo 'Step8 : Import DiVa project in CANoe'
                bat 'D:\\Jenkins\\workspace\\CICT_AutomationDiVaPipeline_Home\\CI_DiVa\\PipelineBatchfiles\\2-1.Automation_Diva_jenkins_step2-4.bat'
                echo 'Step9 : Open CANoe'
                bat 'D:\\Jenkins\\workspace\\CICT_AutomationDiVaPipeline_Home\\CI_DiVa\\PipelineBatchfiles\\2-1.Automation_Diva_jenkins_step2-5.bat'
                echo 'Step10 : Import DiVa project in CANoe'
                bat 'D:\\Jenkins\\workspace\\CICT_AutomationDiVaPipeline_Home\\CI_DiVa\\PipelineBatchfiles\\2-1.Automation_Diva_jenkins_step2-6.bat'
            }
        }
        stage('Report') 
        {
            steps 
            {
                echo 'Move DiVa test report'
                bat 'D:\\Jenkins\\workspace\\CICT_AutomationDiVaPipeline_Home\\CI_DiVa\\PipelineBatchfiles\\2-1.Automation_Diva_jenkins_step3-1.bat'
                
                echo 'Export Xml report'
                bat 'CI_DiVa\\Canoe\\Script\\XmlExportAll.bat'
                
                echo 'Puvlish xUnit test result report'
                xunit([Custom(customXSL: 'CI_DiVa\\Canoe\\ReportStyles/xunit/xunit_coe.xslt', excludesPattern: '', pattern: 'CI_DiVa\\Canoe.DiVa\\Report\\*.xml', stopProcessingIfError: true)])
            
                echo 'Archive TestReport'
                archiveArtifacts artifacts: 'CI_DiVa\\Canoe.DiVa\\Report\\**\\*.vtestreport,CI_DiVa\\Canoe.DiVa\\Report\\**\\*.ASC,CI_DiVa\\Canoe.DiVa\\Report\\**\\*.xml', followSymlinks: false
                
            }
        }
    }
}
