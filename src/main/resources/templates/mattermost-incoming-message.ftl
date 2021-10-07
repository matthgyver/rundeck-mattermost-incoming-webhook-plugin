
<#if executionData.job.group??>
    <#assign jobName="${executionData.job.group} / ${executionData.job.name}">
<#else>
    <#assign jobName="${executionData.job.name}">
</#if>
<#assign message="[Execution #${executionData.id}](${executionData.href}) of job [${jobName}](${executionData.job.href})">
<#if trigger == "start">
    <#assign state="Started">
<#elseif trigger == "failure">
    <#assign state="Failed">
<#else>
    <#assign state="Succeeded">
</#if>

{
   "author_name": "Rundeck", 
   "username": "Rundeck",
   "icon_emoji": ":rundeck:",
   "attachments":[
      {
         "fallback":"${state}: ${message}",
         "pretext":":rundeck: ${message}",
         "color":"${color}",
         "fields":[
            {
               "title":"Job Name",
               "value":"[${jobName}](${executionData.job.href})",
               "short":true
            },
            {
               "title":"Project",
               "value":"${executionData.project}",
               "short":true
            },
            {
               "title":":unicorn_face: Status",
               "value":"${state}",
               "short":true
            },
            {
               "title":":rainbow: Execution ID",
               "value":"[#${executionData.id}](${executionData.href})",
               "short":true
            }
<#if trigger == "failure">
            ,{
               "title":"Failed Nodes",
               "value":"${executionData.failedNodeListString!"- (Job itself failed)"}",
               "short":false
            }
</#if>
]
      }
   ]
}

