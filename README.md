### Important notes About advanced testing
Testing strategy: Standalone tests should be run on schedule or during delpoyment on pull request before merging to the main branch. Tests should be actionable. 


<img src="./images/good_test.jpg" width=500 heigth=500></img>


<<<<<<< Updated upstream
### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices



### Advanced Testing course on dbt website (https://courses.getdbt.com/courses/advanced-testing)

What is considered a good test?
- it should be automated not manual
- it should be fast. if it takes too long no one will do it
- it should be reliable. people should believe it when we say it has failed
- it should be informative and tell us a clue what has been broken
- it should be focused on one issue at the time
=======
very important point is that each test should only test one assumption. Also, tests should be separated from each other. If one test fails the others should be still able to run. 

### what does it mean to test data? 
To test an assumption about the data that we believe is true. We can test the constraints, content, grain, etc. of the table. 

There are generic tests in dbt and some come by default like non-null, unique, expected_values, and relationships. But we can also import a lot more from __dbt utils__ package and use them.

Some tests are like comparing the number of rows for two tables, or comparing the grain of two tables, or other comparisons. 


__Specific tests:__ Tests that are specific for a dataset to test a specific business logic or edge case or **SOMETHING HAS BURNED YOU BEFORE AND YOU WANT TO AVOID IT FOR THE FUTURE**. For these, you write your own SQL test and let dbt automate it.

An example of the specific test will be the total payment shoud be equal to sum of subtotals + taxes + credits 

__Freshness tests:__ We can test the freshness of a source. Very good case is to prevent the models to be built on the top of non-fresh sources. We pick a timestamp of a table we want to test and pick a lowermark and highermark of that data then send warning after 12 hours and error after 24 horus.

**Important link about testing:**
https://docs.getdbt.com/blog/how-to-build-a-mature-dbt-project-from-scratch


__Notes from the above doc:__
Our goal by doing dbt is to provide a version controlled analytics engineering workflow.




**Model Layers:** Staging models only read from the sources, with a light cleaning such as timezones, replacing null values, some basic standardizations. 

Mart models are more heavily transformed and only use staging data using ref.


**Models naming conventions:**
Model names always come as plural and this is the convention for naming a model:

```
<type/dag_stage>_<source/topic>__<additional_context>
```    
Minimize using abbreviations that are related to the domain knowledge. Don't use OS instead of order status.

Booleans should start with is_ or has_

Avoid using reserved words. 

At the very minimum unique and non-null should be applied to all primary keys. 

For CTEs separate import CTEs from logic CTEs.

**Good Point:** Try to filter out data within import CTEs over filtering within logic CTEs. This way it is easily trackable which data contributes to the end result.

DO NOT OPTIMIZE FOR FEWER LINES OF CODES. Always focus on readability.

Use four spaces for indentation. 

**NOTE:** For dbt we use everything lowecase and we use AS before aliases. Always focus on more readability.

If you are grouping by more than a few columns, you better find a better model design. 

Avoid aliases in table joins because it can affect readability negatively.


**YAML Files:** Each sub-directory has to have its own YML file for configurations.

YML and markdowns should start with _ to appear on the top always.

YML files are named like this:

```
_<description>__<config>
```
**Descriptions:** The folder of models such as staging, core, intermediate
**Config:** top level resources like docs, models, sources

Indents in YML file should use two characters. 

dbt_project.yml configurations should be prefixed with + to avoid namespace collision with directories.

example:
```
models:
  my_project:
    marts:
      +materialized: table
```
>>>>>>> Stashed changes

