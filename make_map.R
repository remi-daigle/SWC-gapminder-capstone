data(wrld_simpl)

# mean gdp
gapminder_summary <- gapminder %>%
  group_by(country) %>% 
  summarize(means=mean(gdpPercap))


##### assign colors to each polygon (i.e. country) ####
# first join the wrld_smpl dataframe with the gapminder dataframe by country name (some don't match)
wrld_simpl@data <- left_join(wrld_simpl@data,gapminder_summary,by=c("NAME"="country"))

#create relative index (scale from 1-100)
wrld_simpl$means_index <- round(wrld_simpl$means/max(wrld_simpl$means,na.rm=T)*100)

# make a color scale from the gdp values
wrld_simpl$colorpalette <- rev(heat.colors(100))[wrld_simpl$means_index]

# plot with colors
jpeg("map.jpg")
plot(wrld_simpl,col=wrld_simpl$colorpalette)
dev.off()
