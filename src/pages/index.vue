<template>
<div class="margined">
  <v-container>
  <v-card
    class="mx-auto">
    <v-img
      class="align-end text-white"
      height="200px"
      src="@/assets/me.png"
      cover>

      <v-card-title class="align-end fill-height headline">Maciej Penar, M.Sc.Eng.</v-card-title>
    </v-img>

    <v-card-text>
      <span>Bio</span><br>
      <span class="text--primary">
        <span>
          Full-time foul-mouthed architect in Vulcan Sp. z o.o. and <s> half-time assistant in Rzeszow University of Technology </s> (former) whose main area of interest satellites around data. 
          Query optimization, data storage, data processing, warehousing, ETLs, VIMs, Stream Processing and big <s> data </s> whatever - 
          good chances are that at some point I had read the heckload of books/articles concerning these topics. Recently more involved in DevOps. 
          Security Toddler. Bookworm. Cinephile.
        </span><br><br/>
        <span>
          Also having hate-hate relationship with Social Networks.
        </span>
      </span>
      
    </v-card-text>
  </v-card>
  
  <br/>

  <h1>Fields Of Interest</h1>
  <v-card
      class="mx-auto"
      tile>

      <v-list disabled>
        <v-list-item-group color="primary">
          <v-list-item v-for="(field, i) in fields" :key="i">
            <v-list-item-icon>
				<font-awesome-icon :icon="['fas', field.icon]" />
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title v-text="field.text"></v-list-item-title>
              <v-list-item-subtitle v-text="field.subtext"></v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-card>

  <br/>

  <h1>Articles</h1>
  <v-expansion-panels>
      <v-expansion-panel v-for="(article, i) in articles" :key="i">
        <v-expansion-panel-title>
          <div>
            {{article.title}} ({{article.year}}) <br/>
            <b>{{article.authors}}</b>
          </div>
        </v-expansion-panel-title>
        <v-expansion-panel-text>
          <span>Published in: {{article.book}}</span><br/><br/>
          <span>{{article.abstract}}</span><br/><br/>
          <a v-bind:href="article.link" download>Download</a>
        </v-expansion-panel-text>
      </v-expansion-panel>
    </v-expansion-panels>
  </v-container>
</div>
</template>

<script>
export default {
	name: 'About',
	data: () => ({
	fields:[
		{text: 'Database Management Systems', subtext: 'NoSQL, NewSQL, RDBMS, OLTP, OLAP, Big Data, ...', icon: 'database'},
		{text: 'Stream Processing', subtext: 'Kafka, Samza, Storm, Spark, ...', icon: 'bolt'},
		{text: 'Data Mining / Data Science / Data Analysis', subtext: '... and other things in R', icon: 'chart-bar'},
		{text: 'IT Security', subtext: 'somehow novel for me', icon: 'user-secret'},
		{text: 'DevOps', subtext: 'virtualization, containers, app deployment, configuration management, ...', icon: 'warehouse'},
		{text: 'Software Engineering', subtext: 'Design Patterns, Languages, ....', icon: 'keyboard'},
		{text: 'Dentistry', subtext: '... I guess ...', icon: 'tooth'}
	],
	articles:[
		{link:'./articles/2021_oobacs.pdf',title: 'Object-Oriented Build Automation - A Case Study', authors: 'M.Penar, W. Zychla', year: 2021, book:'TBA',  abstract: 'Fast and precise build and deployment automation is a fundamental task for every project oriented on rapidly appearing changes. As a rule of thumb, the tools used for this task work as procedural-declarative frameworks { often overlooking the extra requirements for large projects like easy parallelization, precise targeting of specific subsystem or general code readability. In this article we document our findings in build automation as we have abandoned the procedural-declarative approach to object-oriented perspective of our setup environment { all implemented in the .NET build automation framework Cake Frosting. Due to the clear separation of the various layers of our system and our codebase we are able to fire up our new build-deployment routines at ease and at specific part of our ecosystem. As the whole routine is written as a C# console application we can easily manage some aspects of parallel execution (i.e. number of threads) of some tasks which results in great drop of job execution time. To further improve the execution time, we introduce the concept of proof-of-work which is a file that stores the information about the last successful build. Together, all of our concepts resulted in a fast build-deployment routine { as in pessimistic scenario we managed to drop to about 30% of the original time. We believe that others may benefit from our case study as the concepts proposed here can be easily incorporated to any other project written in .NET (or one that is built using object-oriented command-line application) - though we would not recommend using our approach in small projects (in terms of KLOC).'},
		{link:'./articles/2020_padw.pdf',title: 'Stream Processing Systems: Prototype Of Active Data Warehouse', authors: 'M.Penar', year: 2020, book:'Zaawansowane systemy informatyczne: studia wybranych przypadków',  abstract: 'Stream processing means that each incoming event triggers some response from system. Unfortunately, contemporary streaming systems are being bookshelved and used only for pipeline definition. Sometimes these pipelines require buffering which may lead to processing the events in scheduled (micro)batches. Nonetheless, there is a bigger potential for the streaming as it can be found in systems built using lambda or kappa architecture. This means that the opportunity to load the underlying Data Warehouse naturally emerges – which leads to decreasing the latency and brings us closer to the (near) Real Time Data Warehouse. In this article we present the basic theory concerning the stream processing, we divide the existing systems based on the method of output delivery and we present the prototype Stream Warehouse Query Language which is used to blend the concepts of Date Warehousing, like dimensions, hierarchies and measures, into the SQL-like language.'},
		{link:'./articles/2019_cqrs.pdf',title: 'Performance Evaluation of CQRS Architecture - Introductory Research', authors: 'M.Penar & M.Niedziela', year: 2019, book:'Studia Informatica',  abstract: 'In recent time some trends have emerged in Software Engineering that aim to encourage the developers and architects to experiment with the Software Architectures that go beyond the classic Three-Tier Architecture. This happens because trends like Cloud Computing, Containerization/Virtualization, Big Data and NoSQL/NewSQL Databases have emerged and are no longer out-of-reach for developers. Within this article, We ponder upon one of themodern architectures – named Command And Query Responsibility Separation Architecture – CQRS. This Architectural Pattern is not leveraged by any existing framework and little scientific materials exist that motivates or even states the advantages of such solution. We consider our work as preparatory, as We carried out some experiments that aimed to estimate the scale of benefits/drawbacks of using such architecture.'},
		{link:'./articles/2018_pawoiuot.pdf', title: 'Performance Analysis of Write Operations In Identity And UUID Ordered Tables', authors: 'M.Penar', year: 2018, book:'IV Podkarpacka Konferencja Młodych Naukowców', abstract: 'Design of the database includes the decision about the physical storage. This is often overlooked as 1) this cannot be expressed in standard SQL and in result each Database Systems have their own way to specify the physical storage and 2) the decision is often made implicitly. This is dangerous situation as many of the databases use B+ trees as table implementation which stores the data physically sorted by some ordering attribute. The choice of the ordering attribute largely affects read and write operations. Commonly, IDENTITY/AUTO_INCREMENT constraint are being chosen as ordering attributes, due to their easy usage and monotonic nature. In some cases ordering tables by the attributes whose values are drawn from uniform distribution leads to better performance in terms of Transactions-Per-Second. Such cases includes situation when data does fit entirely in-memory or when we can limit the set of physical pages being accessed. In the end, however, We cannot entirely say that either monotonic or random attributes are superior. Both have their pros and cons. In this article We present (1) short description of the data structures in contemporary Database Systems, (2) the advantages and the disadvantages of the two common types which are used as the clustering attributes: GUID and IDENTITY, (3) performance analysis of write operation which compare both data types using B+ tree as primary storage and (4) evaluate the efficiency of these bulk load operation using heap files and B+ trees.'},
		{link:'./articles/2016_emrja.pdf',title: 'The Evaluation of Map-Reduce Join Algorithms', authors: 'M.Penar & A. Wilczek', year: 2016, book:'Beyond Databases, Architectures and Structures 2016', abstract: 'In recent years, Map-Reduce systems have grown into leading solution for processing large volumes of data. Often, in order to minimize the execution time, the developers express their programs using procedural language instead of high-level query language. In such cases one has full control over the program execution, what can lead to several problems, especially when join operation is concerned. In the literature the wide range of join techniques has been proposed, although many of them cannot be easily classified using old Map-Side/Reduce-Side distinction. The main goal of this paper is to propose'},
		{link:'./articles/2016_detjmr.pdf',title: 'The Design of the Efficient Theta Join in Map-Reduce Environment', authors: 'M.Penar & A. Wilczek', year: 2016, book:'Beyond Databases, Architectures and Structures 2016', abstract: 'When analysing the data, the user often may want to per-form the join between the input data sources. At first glance, in Map-Reduce programming model, the developer is limited only to equi-joins as they can be easily implemented using the grouping operation. However, some techniques have been developed to leverage the joins using non-equality conditions. In this paper, we propose the enhancement to cross-join based algorithms, like Strict-Even Join, by handling the equality and non-equality conditions separately.'}
	]
	})
};
</script>

<style scoped>
.margined{
  max-width: 80%;
  margin:auto;
}
</style>
