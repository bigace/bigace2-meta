<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>{$title} - BIGACE Web CMS</title>
	<link rel="stylesheet" type="text/css" href="{$subdir}media/style.css">
	<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'/>
</head>
<body>

	<div id="globalHead">
		<a title="BIGACE Web CMS - Homepage" href="/"><img src="{$subdir}media/bigace_logo2.jpg" class="logo2" alt="BIGACE CMS Logo" /></a>
		<div id="hoverText"></div>
        <div id="globalLang">
        	<span class="package-title">{$package}</span><br /><span class="subpackage-title">{$subpackage}</span>        	
        </div>
        <div class="clearer"></div>
	</div>

        <div id="menubar2">
            <a href="{$subdir}index.html" class="back" title="Back to BIGACE API Home">API Home</a>
			<div class="globalLinks">
                  {section name=packagelist loop=$packageindex}
                    <a href="{$subdir}{$packageindex[packagelist].link}" title="">{$packageindex[packagelist].title}</a>
                  {/section}
	        </div>
	        <div class="sfIcon" align="right">
	            <a href="http://sourceforge.net/projects/bigace/" target="_blank"><img src="http://sourceforge.net/sflogo.php?group_id=149865&amp;type=1" alt="BIGACE at Sourceforge" /></a>
	        </div>
        	<span class="clearer"></span>
        </div>
        
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td width="250" class="menu">
    <div id="sideTools">
        <a href="http://dev.bigace-cms.com/" title="BIGACE Developer Website">BIGACE Developer Website</a>
        <a href="http://www.bigace.de/" title="BIGACE Web CMS Homepage, the free PHP Web CMS.">BIGACE Website</a>    
    </div>
	<h2>{$package}</h2>
    {if count($ric) >= 1}
      <div class="package">
        <div id="ric">
	        {section name=ric loop=$ric}
		        <p><a href="{$subdir}{$ric[ric].file}">{$ric[ric].name}</a></p>
	        {/section}
        </div>
      </div>
    {/if}
    {if $hastodos}
      <div class="package">
	    <div id="todolist">
			    <p><a href="{$subdir}{$todolink}">Todo List</a></p>
	    </div>
      </div>
    {/if}
    {*if $tutorials}
		<b>Tutorials/Manuals:</b><br />
        <div class="package">
		{if $tutorials.pkg}
			<strong>Package-level:</strong>
			{section name=ext loop=$tutorials.pkg}
				{$tutorials.pkg[ext]}
			{/section}
		{/if}
		{if $tutorials.cls}
			<strong>Class-level:</strong>
			{section name=ext loop=$tutorials.cls}
				{$tutorials.cls[ext]}
			{/section}
		{/if}
		{if $tutorials.proc}
			<strong>Procedural-level:</strong>
			{section name=ext loop=$tutorials.proc}
				{$tutorials.proc[ext]}
			{/section}
		{/if}
        </div>
    {/if*}
    
    {if !$noleftindex}{assign var="noleftindex" value=false}{/if}
    {if !$noleftindex}
        {*if $compiledinterfaceindex}
          <b>Interfaces:</b><br />
          {eval var=$compiledinterfaceindex}
        {/if}
        <br />
        {if $compiledclassindex}
          <b>Classes:</b><br />
          {eval var=$compiledclassindex}
        {/if}
        <br />
        *}
        {if $compiledfileindex}
          <b>Files:</b><br />
          {eval var=$compiledfileindex}
        {/if}
    {/if}
    </td>
    <td>
      <table cellpadding="10" cellspacing="0" width="100%" border="0"><tr><td valign="top">
				<div id="functions" align="right">
                      {assign var="packagehaselements" value=false}
                      {foreach from=$packageindex item=thispackage}
                        {if in_array($package, $thispackage)}
                          {assign var="packagehaselements" value=true}
                        {/if}
                      {/foreach}
                      {if $packagehaselements}
                  		[<a href="{$subdir}classtrees_{$package}.html">class tree: {$package}</a>]
		                [<a href="{$subdir}elementindex_{$package}.html">index: {$package}</a>]
                      {/if}
                      [<a href="{$subdir}elementindex.html">all elements</a>]
	           </div>
{if !$hasel}{assign var="hasel" value=false}{/if}
{if $eltype == 'class' && $is_interface}{assign var="eltype" value="interface"}{/if}
{if $hasel}
<h1>{$eltype|capitalize}: {$class_name}</h1>
Source Location: {$source_location}<br /><br />
{/if}
