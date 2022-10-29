select dea.continent, dea.location, dea.date,population,vac.new_vaccinations
from [Data Portfolio]..CovidDeaths as dea
join  [Data Portfolio]..CovidVaccinations as vac
on dea.location= vac.location 
and dea.date = vac.date

--creating view to store data for later visulalzation

create view 
percentpopulationvaccinated as 
select dea.continent, dea.location, dea.date,population,vac.new_vaccinations
,SUM(convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.date) as rollingpeoplevaccinated
from [Data Portfolio]..CovidDeaths as dea
join  [Data Portfolio]..CovidVaccinations as vac
on dea.location= vac.location 
and dea.date = vac.date
where dea.continent is not null


select * from percentpopulationvaccinated